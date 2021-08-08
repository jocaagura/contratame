import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import 'svg_proyector_widget.dart';
import 'title_stack.dart';

class FondoWidget extends StatelessWidget {
  final Widget? child;
  final String? titulo;
  final String? svgasset;

  const FondoWidget({this.child, this.titulo, this.svgasset});

  @override
  Widget build(BuildContext context) {
    double alto = BlocCentral().size.height;
    if (BlocCentral().areButtonsIntoBottomMenu()) {
      alto = BlocCentral().size.height * 0.895;
    }

    return Stack(
      children: [
        BounceInDown(
          duration: Duration(milliseconds: 1000),
          child: HeaderCurvo(
            altoDiag: 0.65,
          ),
        ),
        FooterCurvo(
          altoDiag: 0.75,
        ),
        svgasset == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : SvgProyectorWidget(
                svgasset: svgasset!,
              ),
        TitleStackWidget(title: titulo),
        Container(width: BlocCentral().size.width, height: alto, child: child),
        BlocCentral().areButtonsIntoBottomMenu()
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: BlocCentral().size.height * 0.12,
                  width: BlocCentral().size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0.0,
                        0.055,
                        0.115,
                        0.180,
                        0.45
                      ],
                          colors: <Color>[
                        BlocCentral().theme.backgroundColor.withOpacity(0.05),
                        BlocCentral().theme.backgroundColor.withOpacity(0.2),
                        BlocCentral().theme.backgroundColor.withOpacity(0.6),
                        BlocCentral().theme.backgroundColor.withOpacity(0.2),
                        BlocCentral().theme.backgroundColor.withOpacity(0.05),
                      ])),
                ),
              )
            : Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 1.0,
                  height: 1.0,
                )),
      ],
    );
  }
}

class HeaderCurvo extends StatelessWidget {
  final double altoDiag;

  HeaderCurvo({this.altoDiag = 0.75});

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
            color: Theme.of(context).accentColor, altoDiag: altoDiag),
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
            color: Theme.of(context).accentColor, altoDiag: altoDiag),
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
