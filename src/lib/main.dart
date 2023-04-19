import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/pages/index.page.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: ColorPallete.convertToMaterialColor(ColorPallete.backgroundColor) 
      ),
      home: const IndexPage(),
    );
  }
}
