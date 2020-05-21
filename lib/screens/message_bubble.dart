import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  MessageBubble({
    @required this.messageText,
    @required this.messageSender,
    @required this.messageDate,
    @required this.alignment,
    @required this.bubbleColor,
    @required this.textColor});

  final String messageText, messageSender, messageDate;
  final CrossAxisAlignment alignment;
  final Color bubbleColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(messageSender, style: TextStyle(color: Colors.black54),),
          Material(
            color: bubbleColor,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(15.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                  messageText,
                  style: TextStyle(
                    color: textColor
                  ),
              ),
            ),
          ),
          Text(messageDate.substring(11,16), style: TextStyle(color: Colors.black54),),
        ],
      ),
    );
  }
}
