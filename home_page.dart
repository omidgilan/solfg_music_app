
import 'package:flutter/material.dart';
import '../services/json_loader.dart';
import '../widgets/song_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List songs = [];

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  getSongs() async {
    final s = await JsonLoader.loadSongsFromTelegram();
    setState(() => songs = s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("آرشیو موسیقی SOLFG BOT"),
      ),
      body: songs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, i) {
                return SongTile(song: songs[i]);
              },
            ),
    );
  }
}
