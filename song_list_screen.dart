import 'package:flutter/material.dart';
import '../models/song_model.dart';
import 'player_screen.dart';

class SongListScreen extends StatelessWidget {
  final List<SongModel> songs;

  const SongListScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("لیست آهنگ‌ها")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlayerScreen(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
