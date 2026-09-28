import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_app/data/model/song.dart';
import 'package:http/http.dart' as http;
abstract interface class DataSource { //dong vai tro la mot class ao
  Future<List<Song>?> loadData();
}
class RemoteDataSource implements DataSource {
  @override
  Future<List<Song>?> loadData() async {
    const url = 'https://thantrieu.com/resources/braniumapis/songs.jsonn';
    final uri = Uri.parse(url);
    final response = await http.get(uri); //sử dụng plugin http.get() để kéo dữ liệu từ uri về
    if(response.statusCode == 200) { //Theo chuẩn internet thì giá trị 200 có nghĩa là tải thành công
      final bodyContent = utf8.decode(response.bodyBytes); //chuyển định dạng để không bị lỗi font chữ
      var songWrapper = json.decode(bodyContent) as Map; //cặp ngoặc {} ngoài cùng 
      var songList = songWrapper["songs"] as List; //lấy list bài hát từ cặp ngoặc vuông, và hiện đang chỉ là một cái Map thô
      List<Song> songs = songList.map((song) => Song.fromJson(song)).toList(); //lấy songList .map để thực hiện duyệt qua từng cặp dữ liệu của map
      //Cách tương đương cho việc biến đổi map thô 
      // List<Song> songs = []; // Tạo danh sách rỗng chứa các đối tượng Song
      // for (var song in songList) {
      //   Song doiTuongBaiHat = Song.fromJson(
      //     song,
      //   ); // Đúc cục Map 'song' thành Object 'Song'
      //   songs.add(doiTuongBaiHat); // Nhét Object vừa đúc vào danh sách
      // }
      // return songs;
      return songs; //sau khi xử lí xong data sẽ trả về một List như đã hứa (Future)
    } else {
      return null;
    }
  }
}
class LocalDataSource implements DataSource {
  @override
  Future<List<Song>?> loadData() async {
    //Bước lấy dữ liệu
    final response = await rootBundle.loadString('assets/songs.json'); //đọc dữ liệu từ local thì dùng rootBundle.loadString('Đường dẫn')
    //Bước giải mã response va as Map
    final jsonBody = jsonDecode(response) as Map;
    //As List 
    final songList = jsonBody["songs"] as List;
    List<Song> songs = songList.map((song) => Song.fromJson(song)).toList();
    return songs;
  }
}