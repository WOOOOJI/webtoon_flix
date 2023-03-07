import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  List<WebtoonModel> webtoonInstance = [];

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];
    final uri = Uri.parse('$baseUrl/$today');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstance.add(instance);
      }

      return webtoonInstance;
    }
    throw Error();
  }
}
