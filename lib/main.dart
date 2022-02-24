import 'package:flutter/material.dart';
import 'package:hello_app/weather.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const Weather()));
