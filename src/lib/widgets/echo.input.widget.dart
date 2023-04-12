import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class EchoInput extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Color inputColor;
  final Color inputFocusedColor;
  final Color textColor;
  final double borderSide;
  final bool passwordField;
  final double fontSize;
  final TextInputType keyboardType;

  const EchoInput(
      {this.hintText = "",
      this.icon,
      this.inputColor = ColorPallete.backgroundColor,
      this.textColor = ColorPallete.backgroundColor,
      this.inputFocusedColor = ColorPallete.backgroundColorLight,
      this.borderSide = 2,
      this.passwordField = false,
      this.fontSize = 14,
      this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 25),
        child: TextField(
          keyboardType: keyboardType,
          obscureText: passwordField,
          style: TextStyle(color: textColor, fontSize: fontSize),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(25),
              hintText: hintText,
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: inputColor,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: borderSide, color: inputColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(width: borderSide, color: inputFocusedColor),
              )),
        ));
  }
}
