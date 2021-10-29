import 'package:flutter/material.dart';

import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();

  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage = 'Please add height ' + ((isMetric) ? 'Meters' : 'Inches');
    weightMessage = 'Please add weight ' + ((isMetric) ? 'Kgs' : 'Pounds');

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Metric',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Imperial',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            ], isSelected: isSelected, onPressed: toggleMeasure),
            TextField(
              controller: textHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: heightMessage),
            ),
            TextField(
              controller: textWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: weightMessage),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: fontSize),
                )),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
