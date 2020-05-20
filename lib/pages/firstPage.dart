import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

final usersRef = Firestore.instance.collection('users');

final roomsRef = Firestore.instance.collection('rooms');
var uuid = Uuid();
 final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
    functionName: 'addIndex',
    
);
String id;
String joiningUserId;
// using timestamp to create unique id for rooms collection
String roomCode;

class Firstpage extends StatelessWidget {
  final textController = TextEditingController();
  createFirebaseUser() async {
    id = usersRef.document().documentID;

    await usersRef.document(id).setData({
      //not using local timestamp bcz we want latest time
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'id': id,
    });

    final timestamp = (DateTime.now().millisecondsSinceEpoch).toString();
    roomCode = timestamp;
    await roomsRef.document(timestamp).setData({
      'roomId': timestamp,
      'user1': id,
      'user2': '',
      'index':1,
    });
  }

  joinUser(String query) async {
    joiningUserId = usersRef.document().documentID;
    await usersRef.document(joiningUserId).setData({
      'timestamp': new DateTime.now().millisecondsSinceEpoch,
      'id': joiningUserId,
    });

    var roomId;
    final joinRoom= await roomsRef.where('roomId',isEqualTo: query).getDocuments();

    joinRoom.documents.forEach((doc) {
      
      roomId= doc.documentID;
    print(doc.data);
    print(doc.documentID);
    print('room id is ${roomId}');

    });

    // adding second user to the room id created
    await roomsRef.document(roomId).updateData({
      'user2': joiningUserId,
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
              child: Text(
                'Join Room',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print(id);

                Navigator.of(ctx).pop();
                openJoinGameDialog(ctx);
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

  openJoinGameDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: Text('Join Room'),
          elevation: 2,
          children: <Widget>[
            SimpleDialogOption(
              child: TextFormField(
                controller: textController,
                autofocus: true,
              ),
              onPressed: () {},
            ),
            SimpleDialogOption(
              child: RaisedButton(
                  onPressed: () => joinUser(textController.text), child: Text('Join now')),
            ),
             SimpleDialogOption(
              child: RaisedButton(onPressed: ()async{
                      final HttpsCallableResult result = await callable.call();
                      print(result);
                      
                      },child: Text('play game'),),
              
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
                  'Share this code: \n ${roomCode}\nTap to Copy\n${roomCode}',
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
              child: Text('Close'),
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
