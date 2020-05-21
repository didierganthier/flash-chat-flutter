import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/message_bubble.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {

  MessagesStream({@required this.firestore, @required this.loggedInUser});

  final Firestore firestore;
  final FirebaseUser loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>(
      stream: firestore.collection('messages').orderBy("date").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messagesWidgets = [];
        for(var message in messages){
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final messageDate = message.data['date'];

          final messageWidget = MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              messageDate: messageDate,
              alignment: loggedInUser.email == messageSender? CrossAxisAlignment.end: CrossAxisAlignment.start,
              bubbleColor: loggedInUser.email == messageSender? Colors.lightBlue: Colors.white,
              textColor: loggedInUser.email == messageSender? Colors.white: Colors.black);

          messagesWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messagesWidgets,
          ),
        );
      },
    );
  }
}