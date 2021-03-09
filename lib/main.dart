import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Approuter.dart';
import 'constants.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Router App",
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,initialRoute: homeRoute,
      home: Scaffold(body: Home())
    );
  }
}

class Home extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Router App"),
    ),
    floatingActionButton: FloatingActionButton(onPressed: ()
    {
    Navigator.pushNamed(context, feedRoute, arguments: 'Data from home');
    },
    ),
    body: Center(child:Text('Home')),);
}
}
class Feed extends StatelessWidget{
  final String data;
  Feed(this.data);
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar(
        title: Text("Router"),
      ),
      body: Center(child:Text('Feed: $data')),);
  }
}
 