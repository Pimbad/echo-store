import 'dart:async';

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

    SystemChrome.setEnabledSystemUIMode([SystemUiOverlay.bottom] as SystemUiMode);
  }

   void pushHomePage(){
      Timer(const Duration(seconds: 1), (){
          NavigationBloc().pushReplacementTo(context, new WelcomePage());
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
      ),
    );
  }
}