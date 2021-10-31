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
              ),
              WeatherRow('Name of the City: ', result.name),
              WeatherRow('Description: ', result.description),
              WeatherRow(
                  'Temperature: ', result.temperature.toStringAsFixed(2)),
              WeatherRow('Perceived: ', result.perceived.toStringAsFixed(2)),
              WeatherRow('Pressure: ', result.pressure.toString()),
              WeatherRow('Humidity: ', result.humidity.toString()),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(textCity.text);
    setState(() {});
  }

  Widget WeatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor))),
          Expanded(
              flex: 4,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor))),
        ],
      ),
    );
    return row;
  }
}
