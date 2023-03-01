import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  List<WebtoonModel> webtoonInstance = [];

  Future<List<WebtoonModel>> getTodaysToons() async {
    final uri = Uri.parse('$baseUrl/$today');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var toon = WebtoonModel.fromJson(webtoon);
        webtoonInstance.add(toon);
      }

      return webtoonInstance;
    }
    throw Error();
  }
}
