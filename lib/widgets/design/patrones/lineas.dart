import 'package:flutter/material.dart';

Widget lineasFondo(Offset posicion, Size sizeLinea, Color color,
    [double inclinacion = 0.95]) {
  return Positioned(
    top: posicion.dy,
    left: posicion.dx,
    child: Container(
      width: sizeLinea.width,
      height: sizeLinea.height,
      child: _LineasPatron1(
          color: color, size: sizeLinea, inclinacion: inclinacion),
    ),
  );
}

class _LineasPatron1 extends StatefulWidget {
  final Color? color;
  final Size? size;
  final double inclinacion;

  _LineasPatron1({this.inclinacion = 0.95, this.color, this.size});

  @override
  _LineasPatron1State createState() => _LineasPatron1State();
}

class _LineasPatron1State extends State<_LineasPatron1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget.size!,
      painter: DrawLinea(
          size: widget.size,
          color: widget.color,
          inclinacion: widget.inclinacion),
    );
  }
}

class DrawLinea extends CustomPainter {
  final Size? size;
  final Color? color;
  final double inclinacion;

  DrawLinea({this.size, this.color, this.inclinacion = 0.95});

  @override
  void paint(Canvas canvas, Size size) {
    final double radio = size.width * 0.015;
    Paint brush = new Paint()
      ..color = color ?? Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = radio;
    canvas.drawLine(
        Offset(0.0, 0.0), Offset(size.width * inclinacion, size.height), brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
