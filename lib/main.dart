import 'package:flutter/material.dart';
import 'package:navegacao_telas_app/home.dart';
import 'package:navegacao_telas_app/register.dart';
import 'login.dart';
import 'splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Splash(),
      '/login': (context) => Login(),
      '/home': (context) => Home(),
      '/register': (context) => Register(),
    },
  ));
}
