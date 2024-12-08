import 'package:flutter/material.dart';

abstract class ProductsRouter {
  void navigateToWeatherScreen();
}

class NewsRouterImpl implements ProductsRouter {
  final BuildContext context;

  NewsRouterImpl(this.context);

  @override
  void navigateToWeatherScreen() {
    Navigator.pushNamed(context, '/weather');
  }
}
