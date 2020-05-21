import 'package:flutter/material.dart';
import 'package:truth_or_dare/pages/firstPage.dart';
import 'package:truth_or_dare/pages/game.dart';
import './pages/dummy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: 
      // Game(),
      Firstpage(),
      // Dummy(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        backgroundColor: Colors.black,
        primaryColor: Colors.pink[600],
        accentColor: Colors.pink,
         textTheme: TextTheme(
          headline1: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  fontFamily: 'Montserrat'
                ),
          headline2:  TextStyle(
                  color: Colors.pink[600],
                  fontSize: 40,
                  fontFamily: 'Montserrat'
                ),
                headline6:  TextStyle(
                  color: Colors.pink[600],
                  fontSize: 20,
                  fontFamily: 'Montserrat'
                ),
        ),
        
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
