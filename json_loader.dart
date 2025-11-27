
import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonLoader {
  static const String botToken = "5548149661:AAEpk4ayC3UVyjQDmicXQFlWVKRy_6bdV88";
  static const String channelId = "-1001483139407";
  static const String messageId = "18771";

  static Future<List> loadSongsFromTelegram() async {
    try {
      final m = await http.get(
        Uri.parse("https://api.telegram.org/bot$botToken/getMessage?chat_id=$channelId&message_id=$messageId"),
      );
      final data = json.decode(m.body);
      final fileId = data["result"]["document"]["file_id"];

      final info = await http.get(
        Uri.parse("https://api.telegram.org/bot$botToken/getFile?file_id=$fileId"),
      );
      final filePath = json.decode(info.body)["result"]["file_path"];

      final jsonFile = await http.get(
        Uri.parse("https://api.telegram.org/file/bot$botToken/$filePath"),
      );

      return json.decode(jsonFile.body)["songs"];
    } catch (e) {
      print("JSON load error => $e");
      return [];
    }
  }
}
