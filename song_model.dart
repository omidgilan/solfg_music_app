class SongModel {
  final String title;
  final String artist;
  final String fileId;

  SongModel({
    required this.title,
    required this.artist,
    required this.fileId,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'],
      artist: json['artist'],
      fileId: json['file_id'],
    );
  }
}
