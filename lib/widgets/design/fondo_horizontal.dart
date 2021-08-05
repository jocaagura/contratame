import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import 'patrones/dots.dart';
import 'patrones/lineas.dart';

class BannerHorizontal extends StatelessWidget {
  final Widget? child;
  final Size size;
  final Color? color;

  const BannerHorizontal({required this.size, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final colorShade = BlocCentral().theme.accentColor.withOpacity(0.25);
    final anchoColumna1 = size.width * 0.2125;
    final anchoColumna2 = size.width * 0.836;
    final anchoColumna3 = size.width * 0.62322;
    final anchoColumna4 = size.width * 0.25025;

    final bottom1 = size.width * 0.39051;

    final left1 = size.width * 0.543744;
    final left2 = size.width - anchoColumna2;
    final left3 = size.width * 0.33777;
    final altoFila1 = size.width * 0.18590;
    final Size sizeCirculo = Size(size.width * 0.008, size.width * 0.0041);

    final List<Widget> trianguloContenido =
        construirTramaTriangulo(sizeCirculo, color ?? colorShade);
    final List<Widget> contenidoLineas = [];

    construirContenidoLineas() {
      final double intervalo = size.width * 0.045;
      double x = intervalo * -4.45;

      for (int i = 0; i < 10; i++) {
        contenidoLineas.add(lineasFondo(Offset(x, 0.0),
            Size(anchoColumna4, anchoColumna4), color ?? colorShade));
        x = x + intervalo;
      }
    }

    construirContenidoLineas();

    return Center(
      child: Container(
        color: BlocCentral().theme.backgroundColor,
        width: size.width,
        height: size.width * 0.5625,
        alignment: Alignment.center,
        child: Stack(
          children: [
            /// circulo base
            Positioned(
              left: left2,
              child: Container(
                width: anchoColumna2,
                height: altoFila1,
                child: _HeaderCurvo(
                  altoDiag: 1.8,
                ),
              ),
            ),

            /// circulo base II
            Positioned(
              left: left3,
              bottom: bottom1,
              child: Container(
                width: anchoColumna3,
                height: anchoColumna3,
                decoration: BoxDecoration(
                    color: color ?? colorShade,
                    borderRadius: BorderRadius.circular(anchoColumna3 * 0.5)),
              ),
            ),

            /// Circulo externo
            Positioned(
              left: left1,
              bottom: bottom1,
              child: Container(
                width: anchoColumna1,
                height: anchoColumna1,
                decoration: BoxDecoration(
                    color: BlocCentral().theme.canvasColor,
                    borderRadius: BorderRadius.circular(anchoColumna1 * 0.5)),
              ),
            ),

            /// triangulo dots
            Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: trianguloContenido,
              ),
            ),

            /// lineas
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                width: anchoColumna4,
                height: anchoColumna4,
                child: Stack(
                  children: contenidoLineas,
                ),
              ),
            ),

            /// Contenido externo
            Container(width: size.width, height: size.height, child: child),
          ],
        ),
      ),
    );
  }
}

class _HeaderCurvo extends StatelessWidget {
  final double altoDiag;

  _HeaderCurvo({this.altoDiag = 0.75});

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height * 0.4;
    final ancho = MediaQuery.of(context).size.width;

    return Container(
      width: ancho,
      height: alto,
//      color: color,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(
            color: BlocCentral().theme.accentColor, altoDiag: altoDiag),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  final Color? color;
  double altoDiag;

  _HeaderCurvoPainter({this.color, this.altoDiag = 1.95});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propiedades
    paint.color = color!;
//    paint.style           = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    if (altoDiag < 0.15) {
      altoDiag = 0.15;
    }

    final path = new Path();
    // dibujar con el paint

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.5, size.height * altoDiag, 0, 0);

    // dibujamos el path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
