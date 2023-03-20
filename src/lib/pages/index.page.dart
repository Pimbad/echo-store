import 'dart:async';

import 'package:echo_store/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:echo_store/utils/color.pallete.dart';

class IndexPage extends StatefulWidget{
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

   void pushLoginPage(){
      Timer(const Duration(seconds: 3), (){
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (BuildContext builder) => const LoginPage()));
      });
  } 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: Image(image: AssetImage('assets/images/logo.png'))
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: Image(image: AssetImage('assets/images/sub-logo.png')),
            )
          ],
        )
      ),
    );
  }
}