import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'session.dart';

class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }
}
