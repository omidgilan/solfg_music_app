import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../models/song_model.dart';
import 'song_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _pickJson(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final file = result.files.single;
      final jsonString = String.fromCharCodes(file.bytes!);
      final data = jsonDecode(jsonString) as List;

      final songs = data.map((item) => SongModel.fromJson(item)).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongListScreen(songs: songs),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                ),
              ),
              const Text(
                "SOLFG Music Player",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () => _pickJson(context),
                child: const Text("انتخاب فایل Songs.json"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
