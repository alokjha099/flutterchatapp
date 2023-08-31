import 'package:flutter/material.dart';
import 'package:flutterchatapp/ChatScreen.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "chat app",
      home: new HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("chat box"),
      ),
      body: new ChatScreen()
    );
  }
}






