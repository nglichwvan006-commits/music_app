
import 'package:flutter/material.dart';
import 'package:music_app/data/repository/repository.dart';

void main() async {
  var repository = DeFaultRepository();
  var songs = await repository.loadData();
  if(songs != null) {
    for(var song in songs) {
      debugPrint(song.toString());
    }
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
} 