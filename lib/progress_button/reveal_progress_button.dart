import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:progress_button/navigation.dart';
import 'package:progress_button/progress_button/reveal_progress_button_painter.dart';
import 'package:progress_button/progress_button/progress_button.dart';

class RevealProgressButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RevealProgressButtonState();
}

class _RevealProgressButtonState extends State<RevealProgressButton>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _fraction = 0.0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RevealProgressButtonPainter(_fraction, MediaQuery.of(context).size),
      child: ProgressButton(reveal),
    );
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void reveal() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {
          Navigation.navigateTo(context, 'page_two',
              transition: TransitionType.fadeIn);
        }
      });
    _controller.forward();
  }

  void reset() {
    _fraction = 0.0;
  }

}
