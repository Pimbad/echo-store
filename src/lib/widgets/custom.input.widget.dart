import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Color inputColor;
  final Color inputFocusedColor;
  final Color textColor;
  final double borderSide;
  final bool passwordField;
  final double fontSize;
  final TextInputType keyboardType;

  const CustomInput(
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
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: TextField(
          keyboardType: keyboardType,
          obscureText: passwordField,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize 
          ),
          decoration: InputDecoration(
            hintText: hintText,
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: inputColor,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: borderSide,
                  color: inputColor),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: borderSide,
                  color: inputFocusedColor),
              )
            ),
        )
      );
  }
}
