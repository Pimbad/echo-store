import 'package:flutter/material.dart';

import '../widgets/echo.page.widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EchoPage(Text("Register Page")));
  }
}
