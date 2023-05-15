import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class EchoLoading extends StatelessWidget {
  const EchoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: ColorPallete.backgroundColor,
        ));
  }
}
