import 'package:flutter/material.dart';

class ColorPallete {
  static const Color backgroundColor = Color.fromRGBO(141, 27, 30, 1);
  static const Color backgroundColorLight = Color.fromRGBO(196, 81, 85, 1);
  static const Color secondaryBackgroundColor =
      Color.fromRGBO(241, 241, 241, 1);
  static const Color buttonColor = Color.fromRGBO(73, 73, 73, 1);
  static const Color fontColor = Color.fromRGBO(109, 109, 109, 1);

  static MaterialColor convertToMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
