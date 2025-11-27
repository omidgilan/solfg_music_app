
import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final Map song;

  SongTile({required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note, color: Colors.black87),
      title: Text(song["title"] ?? "No Title"),
      subtitle: Text(song["artist"] ?? "Unknown Artist"),
      trailing: Icon(Icons.play_circle_fill, color: Colors.blueAccent, size: 28),
      onTap: () {},
    );
  }
}
