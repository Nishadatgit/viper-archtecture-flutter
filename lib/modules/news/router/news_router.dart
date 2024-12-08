import 'package:flutter/material.dart';

abstract class NewsRouter {
  void navigateToWeatherScreen();
}

class NewsRouterImpl implements NewsRouter {
  final BuildContext context;

  NewsRouterImpl(this.context);

  @override
  void navigateToWeatherScreen() {
    Navigator.pushNamed(context, '/weather');
  }
}
