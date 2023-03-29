import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/sizes.dart';
import '../widgets/custom.input.widget.dart';
import '../widgets/custom.page.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPage(
        Center(
        child: Container(
          alignment: Alignment.center,
          width: Sizes.getPercentWidth(context, 85),
          height: Sizes.getPercentHeight(context, 55),
          child: Column(children: const [
            CustomInput(
              icon: Icons.mail,
              borderSide: 2,
              fontSize: 16,
              keyboardType: TextInputType.emailAddress,
              hintText: "Digite seu email"
            ),

            CustomInput(
              icon: Icons.lock,
              borderSide: 2,
              passwordField: true,
              fontSize: 16,
              hintText: "Digite sua senha"
            )
          ]),
        ),
      )
    )
  );}
}
