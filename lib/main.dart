import 'package:flutter/material.dart';
import 'package:viper_test/dependecy_injection.dart';
import 'package:viper_test/modules/products/view/products_view.dart';
import 'package:viper_test/modules/products_v2/view/products_view_v2.dart';
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
      title: 'VIPER App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsViewV2(),
        '/weather': (context) =>
            WeatherView(), // Placeholder for weather screen
      },
    );
  }
}
