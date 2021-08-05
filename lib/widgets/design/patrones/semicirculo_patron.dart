import 'dart:math' as math;


import 'package:flutter/material.dart';
class SemiCirculoPatron extends StatelessWidget {
  final double diametro;
  final Color color;

  const SemiCirculoPatron({
  this.diametro = 200,
  this.color = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SemiCirculo(color: color),
      size: Size(diametro, diametro),

    );
  }
}

// This is the Painter class
class _SemiCirculo extends CustomPainter {
  final Color color;

  _SemiCirculo({
    this.color = Colors.blue
  });


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = size.width * 0.015;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi * 1.35,
      math.pi * 1.55,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}