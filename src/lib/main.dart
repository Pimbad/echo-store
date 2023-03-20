import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';
import 'package:echo_store/pages/index.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EchoStore",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const IndexPage(),
    );
  }
}
