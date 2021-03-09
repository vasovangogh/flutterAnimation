import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';

class AppRouter{
  static PageRouteBuilder animatedRoute(
      Function(BuildContext, Animation<double>, Animation<double>)
          pageBuilder) {
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  static Route<dynamic> generateRoute(RouteSettings settings){
switch(settings.name){
  case homeRoute:
  return MaterialPageRoute(builder:(_)=>Home());
  case feedRoute:
  var data= settings.arguments as String;
  return animatedRoute((context, anim1, anim2)=>Feed(data));
  default:
  return MaterialPageRoute(builder: (_)=> Scaffold(body:Center(child: Text('No route definde for ${settings.name})')),));
}
  }

}