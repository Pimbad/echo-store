import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class EchoButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final GestureTapCallback onPressed;
  final Color backgroundColor;
  final Color fontColor;

  const EchoButton(
      {this.text = "",
      required this.onPressed,
      this.width = 200,
      this.height = 50,
      this.backgroundColor = ColorPallete.buttonColor,
      this.fontColor = ColorPallete.buttonFontColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
