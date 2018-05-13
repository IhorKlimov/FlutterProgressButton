import 'package:flutter/material.dart';

class RevealProgressButtonPainter extends CustomPainter {
  double _fraction = 0.0;

  RevealProgressButtonPainter(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    var radius = 24.0 + 800 * _fraction;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(RevealProgressButtonPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
