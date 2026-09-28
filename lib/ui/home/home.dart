import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/ui/discovery/discovery.dart';
import 'package:music_app/ui/settings/settings.dart';
import 'package:music_app/ui/user/user.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MUSIC APP", //đặt tên ứng dụng
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), //tạo bảng màu dựa trên màu tím làm chủ đạo
        useMaterial3: true //bật Material Design 3
      ),
      home: MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  final List<Widget> _tab = [
    const HomeTab(),
    const DiscoveryTab(),
    const UserTab(),
    const SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Music App"),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.album),
              label: "Discovery",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), 
              label: "Settings"
            )
          ]
        ), 
        tabBuilder: (BuildContext context, int index) {  
          return _tab[index];
        },
      ),
      
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}