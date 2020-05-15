import 'package:flutter/material.dart';
import 'dart:math';

import 'package:truth_or_dare/models/truth.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

var random;
var index;
String question;

class _GameState extends State<Game> {
  generateQue() {
    var random = Random();
    index = random.nextInt(5);

    print(index);
    setState(() {
      question = truth[index]['que'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateQue();
  }

  @override
  Widget build(BuildContext context) {
    // print(truth[index]['id']);
    // print(truth[index]['que']);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Truth or dare',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30,)),
            SizedBox(height: 40),
            Text(question,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,)),
            
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: generateQue),
          ],
        ),
      ),
    );
  }
}
