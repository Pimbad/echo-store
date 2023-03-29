import 'package:flutter/cupertino.dart';

import '../utils/color.pallete.dart';
import '../utils/sizes.dart';

class CustomPage extends StatelessWidget {
  final Widget children;

  CustomPage(this.children);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: ColorPallete.backgroundColor,
      alignment: Alignment.center,
      child: Column(children: [
        SizedBox(
          width: Sizes.getFullWidth(context),
          height: Sizes.getPercentHeight(context, 20),
          child: Image.asset(
            'assets/images/logo.png',
            scale: 1.2,
          ),
        ),
        SizedBox(
            width: Sizes.getFullWidth(context),
            height: Sizes.getPercentHeight(context, 80),
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
