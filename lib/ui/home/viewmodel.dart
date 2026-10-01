import 'dart:async';

import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/repository/repository.dart';

class MusicAppViewModel {
  StreamController<List<Song>> songStream = StreamController();

  void loadSongs() { //tạo phương thức loadSongs / là phương thức dùng để tải bài hát
    final repository = DeFaultRepository();
    repository.loadData().then((value) => songStream.add(value!));  //sau khi loadData thì dùng then để add vao Stream từng song
  }
}