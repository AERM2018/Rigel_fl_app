import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{
  final double radio;
  final Color color;
  final Offset offset;

  CirclePainter({
    required this.radio,
    required this.color,
    required this.offset
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = color;
    canvas.drawCircle(offset, radio, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}