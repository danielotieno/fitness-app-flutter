import 'package:flutter/material.dart';

import '../data/http_helper.dart';
import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Information'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: getData, child: Text('Get Data')),
          Text(result.name),
        ],
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('Mombasa');
    setState(() {});
  }
}
