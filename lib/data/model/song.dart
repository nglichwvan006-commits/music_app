class Song {
  String id;
  String title;
  String album;
  String artist;
  String source;
  String image;
  int duration;

  //Factory Constractor
  factory Song.fromJson(Map<String, dynamic> map) { //dung factory constractor .fromJson de keo data tu json ve tao thanh object
    return Song(
      id: map["id"],
      title: map["title"] ?? "Không Có Tiêu Đề", 
      album: map["album"] ?? "Chưa Rõ Album",
      artist: map["artist"] ?? "Vô Danh", 
      source: map["source"], 
      image: map["image"], 
      duration: map["duration"]
      );
  }
  //Constractor
  Song(
    {
      required this.id,
      required this.title, 
      required this.album,
      required this.artist,
      required this.source,
      required this.image,
      required this.duration
    }
  );
  
}