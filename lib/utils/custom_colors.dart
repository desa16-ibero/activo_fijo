import 'package:flutter/material.dart';

class CustomColors {
  static const Color dartMainColor = Color(0xFF770014);
  static const Color mainColor = Color(0xFFED1C24);

  static Map<int, Color> color = {
    50: const Color.fromRGBO(119, 0, 20, .1),
    100: const Color.fromRGBO(119, 0, 20, .2),
    200: const Color.fromRGBO(119, 0, 20, .3),
    300: const Color.fromRGBO(119, 0, 20, .4),
    400: const Color.fromRGBO(119, 0, 20, .5),
    500: const Color.fromRGBO(119, 0, 20, .6),
    600: const Color.fromRGBO(119, 0, 20, .7),
    700: const Color.fromRGBO(119, 0, 20, .8),
    800: const Color.fromRGBO(119, 0, 20, .9),
    900: const Color.fromRGBO(119, 0, 20, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFFED1C24, color);
  static MaterialColor dartColorCustom = MaterialColor(0xFF770014, color);
}
