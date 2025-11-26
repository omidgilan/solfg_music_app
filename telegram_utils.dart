import 'dart:convert';
import 'package:http/http.dart' as http;

class TelegramUtils {
  static const botToken =
      "5548149661:AAEpk4ayC3UVyjQDmicXQFlWVKRy_6bdV88";

  static Future<String> resolveFileUrl(String fileId) async {
    final url =
        "https://api.telegram.org/bot$botToken/getFile?file_id=$fileId";

    final res = await http.get(Uri.parse(url));
    final data = jsonDecode(res.body);
    final filePath = data['result']['file_path'];

    return "https://api.telegram.org/file/bot$botToken/$filePath";
  }
}
