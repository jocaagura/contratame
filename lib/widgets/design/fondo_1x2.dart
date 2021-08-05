import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import 'patrones/dots.dart';
import 'patrones/semicirculo_patron.dart';

class Banner2x extends StatelessWidget {
  final Widget? child;
  final Size size;
  final Color? color;

  const Banner2x({required this.size, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final colorShade = BlocCentral().theme.accentColor.withOpacity(0.25);

    final Size sizeCirculo = Size(size.width * 0.008, size.width * 0.0041);
    final List<Widget> trianguloContenido = construirTramaTriangulo(
        sizeCirculo, color ?? colorShade, 26);

    final anchoColumna4 = size.width * 0.1;
    final anchoColumna5 = size.width * 0.0045;
    final anchoColumna6 = size.width * 0.25;

    List<Widget> construirContenidoLineas(double intervalo, [int lineas = 11]) {
      List<Widget> contenidoLineas = [];

      double y = intervalo;
      double x = y * 1.4;
      int duracionTotal = 1400;

      final int intervaloAnimacion = (duracionTotal / lineas).floor();
      int delay = intervaloAnimacion;

      for (int i = 0; i < lineas; i++) {
        contenidoLineas.add(
          Positioned(
            top: y,
            left: x,
            child: FadeInLeft(
              duration: Duration(milliseconds: duracionTotal),
              delay: Duration(milliseconds: delay),
              child: Container(
                width: anchoColumna4,
                height: anchoColumna5,
                color: color ?? colorShade,
              ),
            ),
          ),
        );
        delay = delay + intervaloAnimacion;
        if (delay >= duracionTotal) {
          delay = duracionTotal - intervaloAnimacion;
        }
        y = y + intervalo * 0.1;
        x = x - intervalo * 0.095;
      }

      return contenidoLineas;
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: colorShade),
      child: Stack(
        children: [
          /// triangulo dots
          Positioned(
            top: -size.width * 0.125,
            child: Container(
              width: size.width * 1.5,
              height: size.height * 1.5,
              child: Stack(
                children: trianguloContenido,
              ),
            ),
          ),

          /// lineas
          Container(
            width: size.width,
            height: size.height,
            child:
                Stack(children: construirContenidoLineas(size.width * 0.285)),
          ),

          /// Semicirculo 1
          Positioned(
            bottom: size.width * 0.075,
            right: size.width * -0.0375,
            child: Spin(
              infinite: true,
              duration: Duration(milliseconds: 2250),
              child: Container(
                  width: anchoColumna6,
                  height: anchoColumna6,
                  child: SemiCirculoPatron(
                    diametro: anchoColumna6,
                    color: color ?? colorShade,
                  )),
            ),
          ),

          /// Semicirculo 1
          Positioned(
            bottom: size.width * 0.14,
            right: size.width * 0.035,
            child: Spin(
              duration: Duration(milliseconds: 2750),
              infinite: true,
              child: Container(
                  width: anchoColumna6 * 0.4,
                  height: anchoColumna6 * 0.4,
                  child: SemiCirculoPatron(
                    diametro: anchoColumna6,
                    color: color ?? colorShade,
                  )),
            ),
          ),

          Container(
              width: size.width,
              height: size.height,
              child: child)
        ],
      ),
    );
  }
}
