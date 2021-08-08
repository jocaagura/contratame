import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';

class BotonAccionInferior extends StatelessWidget {
  const BotonAccionInferior(
      {this.duration = 1200,
      this.width,
      this.icon,
      this.label,
      this.function,
      this.emphasize = false});

  final double? width;
  final int duration;
  final IconData? icon;
  final String? label;
  final Function? function;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    double finalWidth = 80.0;

    finalWidth = width ??
        BlocCentral().size.width / BlocCentral().size.aspectRatio * 0.1;

    return InkWell(
      onTap: function as void Function()? ?? null,
      child: Container(
        margin: EdgeInsets.all(finalWidth * 0.05),
        width: finalWidth * 0.9,
        height: finalWidth * 0.9,
        decoration: BoxDecoration(
            color: emphasize
                ? BlocCentral().theme.primaryColorDark
                : BlocCentral().theme.buttonColor,
            borderRadius: BorderRadius.circular(finalWidth * 0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(
              alignment: Alignment.center,
              width: finalWidth * 0.4,
              height: finalWidth * 0.4,
              child: ZoomIn(
                duration: Duration(milliseconds: duration),
                delay: Duration(milliseconds: (duration * 0.5).toInt()),
                child: FaIcon(
                  icon ?? BlocCentral().returnIcondata('ayuda'),
                  color: emphasize == true
                      ? BlocCentral().theme.canvasColor
                      : Theme.of(context).accentColor,
                  size: finalWidth * 0.375,
                ),
              ),
            ),
            BounceInUp(
              duration: Duration(milliseconds: duration),
              child: ZoomIn(
                duration: Duration(milliseconds: duration),
                child: Container(
                  width: finalWidth * 0.86,
                  height: finalWidth * 0.2,
                  child: AutoSizeText(
                    label ?? 'inactive',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    minFontSize: 5.0,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: emphasize == true
                            ? BlocCentral().theme.canvasColor
                            : Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
