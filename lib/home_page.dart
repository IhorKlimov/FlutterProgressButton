import 'package:flutter/material.dart';
import 'package:progress_button/progress_button/reveal_progress_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
          child: RevealProgressButton(),
        ),
      ),
    );
  }
}
