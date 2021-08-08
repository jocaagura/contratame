import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SvgProyectorWidget extends StatelessWidget {
  const SvgProyectorWidget({required this.svgasset});

  final String svgasset;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: Duration(milliseconds: 250),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: Image.asset(
          svgasset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
