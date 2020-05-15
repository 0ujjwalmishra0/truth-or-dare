import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:truth_or_dare/pages/secondPage.dart';


bool isTruth;
bool isDare;

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {


    handleTruth() {
      print('truth tappped!');
      isTruth = true;
      Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeftWithFade,child: SecondPage(isDare: false,isTruth: true), ));
    }

    handleDare() {
      print('Dare tappped!');
      isDare = true;
      Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeftWithFade,child: SecondPage(isDare: true,isTruth: false), ));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: handleTruth,
              child: Text(
                'TRUTH',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  fontFamily: 'Montserrat'
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              height: 50,
              indent: 140,
              endIndent: 140,
            ),
            GestureDetector(
              onTap: handleDare,
              child: Text(
                'DARE',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  // fontFamily: 'Nunito'
                  fontFamily: 'Montserrat'
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}

