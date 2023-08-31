import 'package:flutter/material.dart';
import 'package:flutterchatapp/chat_message.dart';

class ChatScreen extends StatefulWidget{
  @override
  State createState()=>new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Chatmessage>_messages = <Chatmessage>[];

  final TextEditingController _txtctrl = new TextEditingController();

  void _handleSubmited(String text) {
    _txtctrl.clear();
    Chatmessage message = new Chatmessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
  Widget _textComperWidget() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                new InputDecoration.collapsed(hintText: "send  a message"),
                controller: _txtctrl,
                onSubmitted: _handleSubmited,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  onPressed: () => _handleSubmited(_txtctrl.text),
                  icon: new Icon(Icons.send)),
            )
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder:  (_,int index) =>_messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComperWidget(),
        )
      ],
    );
  }
}