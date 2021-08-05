import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleStackWidget extends StatelessWidget {
  final String? titulo;

  const TitleStackWidget({
    this.titulo,
  });

  @override
  Widget build(BuildContext context) {

    if(titulo == null){
      return Container(width: 1.0, height: 1.0,);
    }

    return Positioned(
      right: 0.0,
      top: 10.0,
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.5,
      child: FadeInLeft(
        duration: Duration(milliseconds: 2500),
        delay: Duration(milliseconds: 1500),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(180),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
              child: AutoSizeText(
                titulo!,
                style: TextStyle(fontSize: 16),
              )),
        ),
      ),
    );
  }
}