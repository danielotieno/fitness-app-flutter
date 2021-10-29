import 'package:flutter/material.dart';

import '../data/http_helper.dart';
import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController textCity = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: textCity,
                  decoration: InputDecoration(
                      hintText: 'Enter a City',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: getData,
                      )),
                ),
              )
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(textCity.text);
    setState(() {});
  }
}
