import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

List<Widget> construirTramaTriangulo(Size sizeCirculo, Color color,
    [int numeroFilas = 17]) {
  final Offset inicial =
      Offset(-sizeCirculo.width * 0.5, -sizeCirculo.height * 0.5);
  final Offset inicial2 = Offset(-sizeCirculo.width * 2,
      sizeCirculo.height * 0.5 + sizeCirculo.height * 2);

  List<Widget> trianguloContenido = [];

  Offset tmpOffSet = inicial;
  double intervalox = sizeCirculo.width * 3;
  int iteracionX = 1;
  int iteracionY = numeroFilas;
  final int intervaloAnimacion = (2000 / iteracionY).floor();
  int duracion = intervaloAnimacion;
  bool animar = true;
  int incremento = 0;
  for (int i2 = 0; i2 < iteracionY; i2++) {
    for (int i = 0; i <= iteracionX; i++) {
      if (i % 4 == 0) {
        animar = true;
      } else {
        animar = false;
      }
      trianguloContenido
          .add(dotsFondo(duracion, tmpOffSet, sizeCirculo, color, animar));
      tmpOffSet = Offset((tmpOffSet.dx + intervalox), tmpOffSet.dy);
    }
    duracion = duracion + intervaloAnimacion;
    if (duracion >= 2000) {
      duracion = 200;
    }
    if (i2 % 2 == 0) {
      tmpOffSet = Offset(inicial.dx,
          (inicial2.dy * incremento + sizeCirculo.height * incremento));
    } else {
      iteracionX = iteracionX + 1;
      tmpOffSet = Offset(inicial2.dx,
          (inicial2.dy * incremento + sizeCirculo.height * incremento));
    }
    incremento = incremento + 1;
  }
  incremento = incremento - 1;
  duracion = 1999;
  for (int i2 = 0; i2 < iteracionY; i2++) {
    duracion = duracion - intervaloAnimacion;
    if (duracion < 200) {
      duracion = 200;
    }
    if (i2 % 2 == 0) {
      iteracionX = iteracionX - 1;
      tmpOffSet = Offset(inicial.dx,
          (inicial2.dy * incremento + sizeCirculo.height * incremento));
    } else {
      tmpOffSet = Offset(inicial2.dx,
          (inicial2.dy * incremento + sizeCirculo.height * incremento));
    }
    for (int i = 0; i <= iteracionX; i++) {
      trianguloContenido
          .add(dotsFondo(duracion, tmpOffSet, sizeCirculo, color));
      tmpOffSet = Offset((tmpOffSet.dx + intervalox), tmpOffSet.dy);
    }
    incremento = incremento + 1;
  }

  return trianguloContenido;
}

Widget dotsFondo(int duracion, Offset posicion, Size sizeCirculo, Color color,
    [bool animar = true]) {
  if (animar) {
    return Positioned(
      top: posicion.dy,
      left: posicion.dx,
      child: Container(
        width: sizeCirculo.width,
        height: sizeCirculo.height,
        child: _CirculoPatron1(
          color: color,
          size: sizeCirculo,
        ),
      ),
    );
  } else {
    return Positioned(
      top: posicion.dy,
      left: posicion.dx,
      child: FadeIn(
        duration: Duration(milliseconds: 2000),
        delay: Duration(milliseconds: duracion),
        child: Container(
          width: sizeCirculo.width,
          height: sizeCirculo.height,
          child: _CirculoPatron1(
            color: color,
            size: sizeCirculo,
          ),
        ),
      ),
    );
  }
}

class _CirculoPatron1 extends StatefulWidget {
  final Map<String, double>? center;
  final Color? color;
  final Size? size;

  _CirculoPatron1({this.center, this.color, this.size});

  @override
  _CirculoPatron1State createState() => _CirculoPatron1State();
}

class _CirculoPatron1State extends State<_CirculoPatron1>
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
      painter: DrawCircle(size: widget.size, color: widget.color),
    );
  }
}

class DrawCircle extends CustomPainter {
  final Size? size;
  final Color? color;

  DrawCircle({this.size, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double radio = size.width * 0.5;

    Paint brush = new Paint()
      ..color = color ?? Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = radio;
    canvas.drawCircle(Offset(radio, radio), size.width * 0.5, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
