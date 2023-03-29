import 'package:flutter/material.dart';

class Sizes {
  static double getFullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getFullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getHalfWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;

  static double getHalfHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 2;

  static double getPercentWidth(BuildContext context, int percent) =>
      MediaQuery.of(context).size.width * (percent / 100);

  static double getPercentHeight(BuildContext context, int percent) =>
      MediaQuery.of(context).size.height * (percent / 100);
}
