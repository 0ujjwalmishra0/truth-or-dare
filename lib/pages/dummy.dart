import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final roomsRef = Firestore.instance.collection('rooms');

// using timestamp to create unique id for rooms collection
String roomCode;

class Dummy extends StatelessWidget {
  final textController = TextEditingController();
  createFirebaseUser() async {

    final timestamp = (DateTime.now().millisecondsSinceEpoch).toString();
    roomCode = timestamp;
    await roomsRef.document(timestamp).setData({
      'roomId': timestamp,
      
    });
  }

  

  openPlayOnlineDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: Text('Play Online'),
          elevation: 2,
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                'Create Room',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                createFirebaseUser();
                Navigator.of(ctx).pop();
                openCreateRoomDialog(ctx);
              },
            ),
            
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: Navigator.of(ctx).pop,
            ),
          ],
        );
      },
    );
  }

  openCreateRoomDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: Text('Create Room'),
          elevation: 2,
          children: <Widget>[
            SimpleDialogOption(
                child: Text(
                  'Share this code: \n ${roomCode}\n Tap to Copy',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: roomCode),
                  );
                  
                  print(roomCode);
                }),
            SimpleDialogOption(
              child: TextFormField(),
              onPressed: Navigator.of(ctx).pop,
            ),
            SimpleDialogOption(
              child: Text('${roomCode}'),
              onPressed: Navigator.of(ctx).pop,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Play Locally',
              style: Theme.of(context).textTheme.headline6,
            ),
            RaisedButton(
              onPressed: () => openPlayOnlineDialog(context),
              child: Text(
                'Play Online',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
