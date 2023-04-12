import 'dart:async';

import 'package:echo_store/pages/login.page.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../router/router.dart';
import '../utils/sizes.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    pushLoginPage();
  }

  void pushLoginPage() {
    Timer(const Duration(seconds: 3),
        () => EchoRouter.pushReplacement(const LoginPage(), context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: Sizes.getFullWidth(context),
          height: Sizes.getFullHeight(context),
          color: ColorPallete.backgroundColor,
          child: Center(
            child: SizedBox(
            width: Sizes.getPercentWidth(context, 70),
            height: Sizes.getPercentHeight(context, 70),
            child:
            Image.asset(
              'assets/images/logo.png',
              scale: 1,
            ),
          ),
        )
      )
    );
  }
}
