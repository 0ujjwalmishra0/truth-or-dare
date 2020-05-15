import 'package:flutter/material.dart';
import 'package:truth_or_dare/pages/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Game(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
          backgroundColor: Colors.black,
          primaryColor: Colors.pink[600],
          accentColor: Colors.pink,
          primaryTextTheme: TextTheme(
              headline1: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30))),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
