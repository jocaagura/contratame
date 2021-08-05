import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:contratame/blocs/bloc_central.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class BotonAccionInferior extends StatelessWidget {
  const BotonAccionInferior(
      {this.duracion = 1200,
        this.ancho,
        this.icono,
        this.label,
        this.funcion,
        this.enfasis = false});

  final double? ancho;
  final int duracion;
  final IconData? icono;
  final String? label;
  final Function? funcion;
  final bool enfasis;

  @override
  Widget build(BuildContext context) {
    double? ancho2 = 80.0;

    ancho2 = BlocCentral().size.width / BlocCentral().size.aspectRatio * 0.1;

    if (ancho != null) {
      ancho2 = ancho;
    }

    return InkWell(
      onTap: funcion as void Function()? ?? null,
      child: Container(
        margin: EdgeInsets.all(ancho2! * 0.05),
        width: ancho2 * 0.9,
        height: ancho2 * 0.9,
        decoration: BoxDecoration(
            color: enfasis
                ? BlocCentral().theme.primaryColorDark
                : BlocCentral().theme.buttonColor,
            borderRadius: BorderRadius.circular(ancho2 * 0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(
              alignment: Alignment.center,
              width: ancho2 * 0.4,
              height: ancho2 * 0.4,
              child: ZoomIn(
                duration: Duration(milliseconds: duracion),
                delay: Duration(milliseconds: (duracion * 0.5).toInt()),
                child: FaIcon(
                  icono ?? BlocCentral().returnIcondata('ayuda'),
                  color: enfasis == true
                      ? BlocCentral().theme.canvasColor
                      : Theme.of(context).accentColor,
                  size: ancho2 * 0.375,
                ),
              ),
            ),
            BounceInUp(
              duration: Duration(milliseconds: duracion),
              child: ZoomIn(
                duration: Duration(milliseconds: duracion),
                child: Container(
                  width: ancho2 * 0.86,
                  height: ancho2 * 0.2,
                  child: AutoSizeText(
                    label ?? 'inactivo',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    minFontSize: 5.0,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: enfasis == true
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
