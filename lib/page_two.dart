import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  final String title;

  PageTwo({Key key, this.title}) : super(key: key);

  @override
  _PageTwoState createState() => new _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
