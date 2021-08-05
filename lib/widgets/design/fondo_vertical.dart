import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

class BannerVertical extends StatelessWidget {
  final Widget? child;
  final Size size;
  final Color? color;

  const BannerVertical({required this.size, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final radioC1 = size.width;
    final radioC2 = size.width * 0.5;
    final colorShade = BlocCentral().theme.accentColor.withOpacity(0.25);

    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      color: BlocCentral().theme.backgroundColor,
      child: Stack(
        children: [
          HeaderCurvo(
            altoDiag: 0.75,
            size: size,
          ),

          /// Circulo 2
          Positioned(
            top: -radioC1 * 0.625,
            child: FadeIn(
              duration: Duration(milliseconds: 1000),
              child: BounceInDown(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 400),
                child: Container(
                  width: radioC1,
                  height: radioC1,
                  decoration: BoxDecoration(
                      color: color ?? colorShade,
                      borderRadius: BorderRadius.circular(radioC1)),
                ),
              ),
            ),
          ),

          /// Circulo 3
          Positioned(
            left: radioC2 * 0.5,
            top: -radioC2 * 0.275,
            child: FadeIn(
              duration: Duration(milliseconds: 1300),
              child: BounceInDown(
                duration: Duration(milliseconds: 1300),
                delay: Duration(milliseconds: 600),
                child: Container(
                  width: radioC2,
                  height: radioC2,
                  decoration: BoxDecoration(
                      color: BlocCentral().theme.canvasColor,
                      borderRadius: BorderRadius.circular(radioC1)),
                ),
              ),
            ),
          ),
          FooterCurvo(
            altoDiag: 0.75,
          ),
          Container(width: size.width, height: size.height, child: child)
        ],
      ),
    );
  }
}

class HeaderCurvo extends StatelessWidget {
  final double altoDiag;
  final Size size;

  HeaderCurvo({this.altoDiag = 0.75, required this.size});

  @override
  Widget build(BuildContext context) {
    final ancho = size.width;
    final alto = size.height * 0.25;

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

  _HeaderCurvoPainter({this.color, this.altoDiag = 0.75});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propiedades
    paint.color = color!;
//    paint.style           = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    if (altoDiag > 0.8) {
      altoDiag = 0.8;
    }

    if (altoDiag < 0.15) {
      altoDiag = 0.15;
    }

    final path = new Path();
    // dibujar con el paint

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * altoDiag);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, 0, size.height * altoDiag);

    // dibujamos el path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class FooterCurvo extends StatelessWidget {
  final double altoDiag;

  FooterCurvo({this.altoDiag = 0.75});

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;

    return Container(
      width: ancho,
      height: alto,
//      color: color,
      child: CustomPaint(
        painter: _FooterCurvoPainter(
            color: BlocCentral().theme.accentColor, altoDiag: altoDiag),
      ),
    );
  }
}

class _FooterCurvoPainter extends CustomPainter {
  final Color? color;
  double altoDiag;

  _FooterCurvoPainter({this.color, this.altoDiag = 0.75});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propiedades
    paint.color = color!;
//    paint.style           = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    if (altoDiag > 0.8) {
      altoDiag = 0.8;
    }

    if (altoDiag < 0.15) {
      altoDiag = 0.15;
    }

    final path = new Path();
    // dibujar con el paint

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
//    path.lineTo(size.width * 0.5, size.height * altoDiag);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * altoDiag, 0, size.height);

    // dibujamos el path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
