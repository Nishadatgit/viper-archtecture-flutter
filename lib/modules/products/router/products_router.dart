import 'package:flutter/material.dart';

abstract class ProductsRouter {
  void navigateToWeatherScreen();
}

class ProductsRouterImpl implements ProductsRouter {
  final BuildContext context;

  ProductsRouterImpl(this.context);

  @override
  void navigateToWeatherScreen() {
    Navigator.pushNamed(context, '/weather');
  }
}
