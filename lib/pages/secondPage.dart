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
      index = random.nextInt(5);

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
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                thickness: 1.8,
                color: Theme.of(context).primaryColor,
                indent: 160,
                endIndent: 160,
                height: 30,
              ),
              Text(
                question ?? 'Press refresh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),
              ),
              Divider(
                thickness: 1.8,
                color: Theme.of(context).primaryColor,
                indent: 160,
                endIndent: 160,
                height: 30,
              ),
            ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(text,style: TextStyle(fontSize: 25,color: Theme.of(context).primaryColor),),
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
                                height: 40,
                  margin: EdgeInsets.all(30),
                  child: FloatingActionButton(
                    
                    child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 24,
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
