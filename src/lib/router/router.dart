import 'package:flutter/cupertino.dart';

class CustomRouter {
  static Route _createRoute(StatefulWidget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static void push(StatefulWidget page, BuildContext context) =>
      Navigator.of(context).push(_createRoute(page));

  static void pushReplacement(StatefulWidget page, BuildContext context) =>
      Navigator.of(context).pushReplacement(_createRoute(page));
}
