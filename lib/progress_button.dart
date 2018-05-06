import 'package:flutter/material.dart';
import 'dart:async';

class ProgressButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  int _state = 0;
  double _width = double.infinity;
  Animation _animation;
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.blue,
        elevation: _isPressed ? 6.0 : 4.0,
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          key: _globalKey,
          height: 48.0,
          width: _width,
          child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            color: _state == 2 ? Colors.green : Colors.blue,
            child: buildButtonChild(),
            onPressed: () {},
            onHighlightChanged: (isPressed) {
              setState(() {
                _isPressed = isPressed;
                if (_state == 0) {
                  animateButton();
                }
              });
            },
          ),
        ));
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    var controller =
    AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), (){
      setState(() {
        _state = 2;
      });
    });
  }

  Widget buildButtonChild() {
    if (_state == 0) {
      return Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (_state == 1) {
      return SizedBox(
          height: 36.0,
          width: 36.0,
          child: CircularProgressIndicator(
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }
}
