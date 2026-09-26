import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/source/source.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DeFaultRepository implements Repository {
  final _remoteDataSource = RemoteDataSource();
  final _localDataSource = LocalDataSource();
  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];
    await _remoteDataSource.loadData().then((remoteSongs) {
      if(remoteSongs == null) {
        _localDataSource.loadData().then((localSongs) {
          if(localSongs != null) {
            songs.addAll(localSongs);
          }
        });
      } else {
        songs.addAll(remoteSongs);
      }
    });
    return songs;
  }
}