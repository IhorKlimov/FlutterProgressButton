import 'package:flutter/material.dart';
import 'dart:math';

class RevealProgressButtonPainter extends CustomPainter {
  double _fraction = 0.0;
  Size _screenSize;

  RevealProgressButtonPainter(this._fraction, this._screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // todo Fix this
    // This solution is partially wrong,
    // because final radius should use button's vertical offset in a parent in a calculation
    var radius = 24.0 + max(_screenSize.height, _screenSize.width) * _fraction;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(RevealProgressButtonPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
