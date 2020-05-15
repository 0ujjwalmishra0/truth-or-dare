import 'dart:math';

import 'package:flutter/material.dart';
import '../models/truth.dart';
import '../models/dare.dart';

var random;
var index;
String question;

class SecondPage extends StatefulWidget {
  bool isTruth;
  bool isDare;

  SecondPage({
    this.isTruth,
    this.isDare,
  });
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  @override
  Widget build(BuildContext context) {
    String text = widget.isDare == true ? 'Dare' : 'Truth';
    generateQue() {
      var random = Random();
      index = random.nextInt(150);

      print(index);
      setState(() {
        // question = truth[index]['que'];
        question =
            (widget.isDare) == true ? dare[index]['que'] : truth[index]['que'];
        print(question);
        print(widget.isDare);
      });
    }

    @override
    void initState() {
      super.initState();
      generateQue();
    }

    Widget buildText() {
      return  Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(
                  thickness: 1.8,
                  color: Theme.of(context).primaryColor,
                  indent: 120,
                  endIndent: 120,
                  height: 45,
                ),
                Text(
                  question ?? 'Press refresh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  thickness: 1.8,
                  color: Theme.of(context).primaryColor,
                  indent: 120,
                  endIndent: 120,
                  height: 45,
                ),
              ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(text,style: TextStyle(fontSize: 28,color: Theme.of(context).primaryColor),),
        backgroundColor: Colors.black54,
        centerTitle: true,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
          
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            
            buildText(),
            
              Align(
                alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 55,
                  margin: EdgeInsets.all(45),
                  child: FloatingActionButton(
                    
                    child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: generateQue),
                ),
              ),
           
          ],
        ),
      ),
    );
  }
}
