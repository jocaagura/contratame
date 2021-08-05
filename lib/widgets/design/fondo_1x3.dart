import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

class Banner3x extends StatelessWidget {
  final Widget? child;
  final Size size;
  final Color? color;

  const Banner3x({required this.size, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final radio1 = size.width * 0.05;
    final radio2 = radio1 * 0.5;
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          /// Fondo
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  color ?? BlocCentral().theme.accentColor,
                  BlocCentral().theme.backgroundColor
                ])),
          ),

          /// Circulo decoración
          Positioned(
            top: -radio2,
            left: -radio2,
            child: FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Container(
                width: radio1,
                height: radio1,
                decoration: BoxDecoration(
                    color: BlocCentral().theme.primaryColorDark,
                    borderRadius: BorderRadius.circular(radio1)),
              ),
            ),
          ),

          /// Cinta derecha
          Positioned(
            right: 0.0,
            child: FadeInRight(
              duration: Duration(milliseconds: 700),
              child: Container(
                width: radio1 * 0.65,
                height: size.height,
                decoration: BoxDecoration(
                  color: BlocCentral().theme.primaryColorDark,
                ),
              ),
            ),
          ),
          Container(width: size.width, height: size.height, child: child)
        ],
      ),
    );
  }
}
