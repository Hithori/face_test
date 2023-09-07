import 'package:flutter/widgets.dart';

abstract class Gradients {
  static const mainScreen = LinearGradient(
    colors: [
      Color.fromRGBO(0, 0, 0, 0.00),
      Color.fromRGBO(0, 0, 0, 0.02),
      Color.fromRGBO(0, 0, 0, 0.05),
      Color.fromRGBO(0, 0, 0, 0.12),
      Color.fromRGBO(0, 0, 0, 0.20),
      Color.fromRGBO(0, 0, 0, 0.29),
      Color.fromRGBO(0, 0, 0, 0.39),
      Color.fromRGBO(0, 0, 0, 0.50),
      Color.fromRGBO(0, 0, 0, 0.61),
      Color.fromRGBO(0, 0, 0, 0.71),
      Color.fromRGBO(0, 0, 0, 0.80),
      Color.fromRGBO(0, 0, 0, 0.88),
      Color.fromRGBO(0, 0, 0, 0.95),
      Color.fromRGBO(0, 0, 0, 0.98),
    ],
    stops: [
      0,
      0.0922,
      0.1876,
      0.2848,
      0.3819,
      0.4775,
      0.5699,
      0.6575,
      0.7387,
      0.8118,
      0.8752,
      0.9274,
      0.9666,
      0.9914,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
