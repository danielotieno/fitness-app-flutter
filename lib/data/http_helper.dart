import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'weather.dart';

class HttpHelper {
  // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  final String authority = dotenv.env['AUTHORITY']!;
  final String path = dotenv.env['PATH']!;
  final String apiKey = dotenv.env['API_KEY']!;

  Future<Weather> getWeather(String city) async {
    Map<String, dynamic> parameters = {'q': city, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);

    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
