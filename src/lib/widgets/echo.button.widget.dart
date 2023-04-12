import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class EchoButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final GestureTapCallback onPressed;
  final Color backgroundColor;
  final Color fontColor;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  const EchoButton(
      {this.text = "",
      required this.onPressed,
      this.width = 200,
      this.height = 50,
      this.backgroundColor = ColorPallete.buttonColor,
      this.fontColor = ColorPallete.buttonFontColor,
      this.paddingTop = 10,
      this.paddingBottom = 10,
      this.paddingLeft = 10,
      this.paddingRight = 10,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight),
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(backgroundColor)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: fontColor),
          ),
        ),
      ),
    );
  }
}
