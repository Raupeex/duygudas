import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkLoginStatus(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn) {
    Navigator.pushReplacementNamed(context, '/main_page');
  } else {
    Navigator.pushReplacementNamed(context, '/login_page');
  }
}
