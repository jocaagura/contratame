import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:contratame/blocs/bloc_central.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget(
      {this.okButton = 'Ok !!',
      this.funcionLabel = '',
      this.iconoTitulo,
      this.contenido,
      this.titulo = 'Alerta'});

  final String okButton;
  final String funcionLabel;
  final String titulo;
  final Widget? contenido;
  final IconData? iconoTitulo;

  @override
  Widget build(BuildContext context) {
    final double ancho = MediaQuery.of(context).size.width * 0.9;
    final double alto = MediaQuery.of(context).size.height * 0.7;

    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),

        /// Fondo del alerta
        FadeInDown(
          duration: Duration(milliseconds: 750),
          child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.15),
            width: ancho,
            height: alto,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 3.0,
                )),
            child: Stack(
              children: [
                /// Encabezado
                FadeInDown(
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(milliseconds: 200),
                  child: Container(
                    margin: EdgeInsets.only(left: ancho * 0.01, top: 4.0),
                    width: ancho * 0.96,
                    height: alto * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: alto * 0.1,
                          width: ancho * 0.2,
                          child: FaIcon(
                            iconoTitulo ?? FontAwesomeIcons.exclamationTriangle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          height: alto * 0.1,
                          width: ancho * 0.725,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            titulo,
                            minFontSize: 6.0,
                            maxFontSize: 18.0,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Contenedor del contenido
                FadeInDown(
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(milliseconds: 500),
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(left: ancho * 0.034, top: alto * 0.12),
                    width: ancho * 0.92,
                    height: alto * 0.68,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2.0),
                    ),
                    child: Container(
                      width: ancho * 0.88,
                      height: alto * 0.65,
                      color: Theme.of(context).backgroundColor,
                      child: contenido,
                    ),
                  ),
                ),

                /// Acciones
                Container(
                  width: ancho * 0.9,
                  height: alto * 0.125,
                  margin:
                      EdgeInsets.only(top: alto * 0.85, left: ancho * 0.035),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      funcionLabel == ''
                          ? Container(
                              alignment: Alignment.center,
                              height: alto * 0.11,
                              width: ancho * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                            )
                          : RawMaterialButton(
                              onPressed: () {
                                BlocCentral().alert = null;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: alto * 0.11,
                                width: ancho * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade400,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.0,
                                    )),
                                child: AutoSizeText(
                                  funcionLabel,
                                  minFontSize: 8,
                                  maxFontSize: 18,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: ancho * 0.03,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          BlocCentral().alert = null;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: alto * 0.11,
                          width: ancho * 0.4,
                          decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              )),
                          child: AutoSizeText(
                            okButton,
                            minFontSize: 8,
                            maxFontSize: 18,
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
