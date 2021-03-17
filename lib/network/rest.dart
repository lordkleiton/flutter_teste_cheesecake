import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RestManager {
  static const String _url = 'https://blog.cheesecakelabs.com/challenge';

  static Future<List<Map<String, dynamic>>> get() async {
    final http.Response r = await http.get(Uri.parse(_url));

    if (r.statusCode == 200) {
      return (jsonDecode(r.body) as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception(
          'error requesting $_url: [${r.statusCode}] ${r.reasonPhrase}');
    }
  }
}
