import 'package:flutter/material.dart';

import '../widgets/echo.page.widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EchoPage(Text("Forgot Password")));
  }
}
