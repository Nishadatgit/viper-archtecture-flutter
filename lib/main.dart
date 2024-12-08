import 'package:flutter/material.dart';
import 'package:viper_test/dependecy_injection.dart';
import 'package:viper_test/modules/news/view/new_view.dart';
import 'package:viper_test/modules/weather/view/weather_view.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIPER News App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => NewsView(),
        '/weather': (context) =>
            WeatherView(), // Placeholder for weather screen
      },
    );
  }
}
