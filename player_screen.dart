import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/song_model.dart';
import '../utils/telegram_utils.dart';

class PlayerScreen extends StatefulWidget {
  final SongModel song;

  const PlayerScreen({super.key, required this.song});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _play();
  }

  Future<void> _play() async {
    final url = await TelegramUtils.resolveFileUrl(widget.song.fileId);
    player.play(UrlSource(url));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.song.artist, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => player.pause(),
              child: const Text("Pause"),
            ),
            ElevatedButton(
              onPressed: () => player.resume(),
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
