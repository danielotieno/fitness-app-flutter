import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class HttpHelper {
  // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '3ade05f59229bb658e244bb8ce524f18';

  Future<Weather> getWeather(String city) async {
    Map<String, dynamic> parameters = {'q': city, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);

    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
