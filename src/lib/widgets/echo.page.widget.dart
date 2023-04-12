import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color.pallete.dart';
import '../utils/sizes.dart';

class EchoPage extends StatelessWidget {
  final Widget? children;
  final double percentHeightOverlay;
  final double percentHeightBody;

  const EchoPage(this.children, {this.percentHeightOverlay = 20, this.percentHeightBody = 80, super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));

    return SingleChildScrollView(
      child: Container(
      color: ColorPallete.backgroundColor,
      alignment: Alignment.center,
      child: Column(children: [
        SizedBox(
          height: Sizes.getPercentHeight(context, percentHeightOverlay),
          child: Center(
            child: SizedBox(
              height: Sizes.getPercentHeight(context, 16),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fill,
                scale: 1,
              ),
            )
          )
        ),
        SizedBox(
            width: Sizes.getFullWidth(context),
            height: Sizes.getPercentHeight(context, percentHeightBody),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ColorPallete.secondaryBackgroundColor),
              child: children,
            ))
      ]),
    ));
  }
}
