import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SolfgMusicApp());
}

class SolfgMusicApp extends StatelessWidget {
  const SolfgMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOLFG Music Player',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
