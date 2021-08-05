import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';

class FatButtonJocaagura extends StatefulWidget {
  final IconData? icono;
  final String? texto;
  final Color? color1;
  final Color? color2;
  final Function onTap;
  final String? rutaSonido;
  final double? anchoBoton;
  final String? acceso;

  const FatButtonJocaagura(
      {required this.icono,
      required this.texto,
      required this.onTap,
      this.color1,
      this.color2,
      this.rutaSonido,
      this.anchoBoton,
      this.acceso});

  @override
  _FatButtonJocaaguraState createState() => _FatButtonJocaaguraState();
}

class _FatButtonJocaaguraState extends State<FatButtonJocaagura> {
  double? ancho;
  double? anchoInicial;
  double? alto;

  @override
  Widget build(BuildContext context) {
    String acceso = widget.acceso ?? '';
    if (BlocCentral().ckeckPolicyAccsess(acceso) == false) {
      return Container(
        width: 1,
        height: 1,
      );
    }

    double aspectRatio = 1 / 3.03;

    if (ancho == null) {
      if (widget.anchoBoton != null) {
        ancho = widget.anchoBoton;
        anchoInicial = ancho;
        alto = ancho! * aspectRatio;
        if (alto! > 130.0) {
          alto = 130.0;
        }
      } else {
        ancho = BlocCentral().size.width * 0.85;
        if (BlocCentral().displayModo == 2) {
          ancho = BlocCentral().size.width * 0.5;
        }
        anchoInicial = ancho;
        alto = ancho! * aspectRatio;
      }
    }

    Widget separador = SizedBox(
      width: ancho! * 0.011988012,
    );

    return FadeInLeft(
      duration: Duration(milliseconds: 250),
//      delay: Duration(milliseconds: 100),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.bounceOut,
        width: ancho,
        margin: EdgeInsets.all(ancho! * 0.01),
        child: InkWell(
          onTap: () {
            if (widget.rutaSonido != null) {
              /// todo: complete audio functions
            }
            setState(() {
              double anchoTmp = MediaQuery.of(context).size.width * 0.9;
              if (ancho! * 1.2 < anchoTmp) {
                anchoTmp = ancho! * 1.2;
              }
              ancho == anchoInicial ? ancho = anchoTmp : ancho = anchoInicial;
            });
            widget.onTap();
          },
          child: Stack(
            children: <Widget>[
              _BotonGordoBackground(
                color1: widget.color1 ?? Theme.of(context).primaryColor,
                color2: widget.color2 ?? Theme.of(context).accentColor,
                icono: widget.icono,
                alto: alto,
                ancho: ancho,
              ),
              Container(
                width: ancho,
                height: alto,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: ancho! * 0.070887446,
                      ),
                      Container(
                        width: ancho! * 0.165834166,
                        child: Center(
                          child: FaIcon(
                            widget.icono,
                            color: Theme.of(context).accentColor,
                            size: ancho! * 0.13,
                          ),
                        ),
                      ),
                      separador,
                      Container(
                        alignment: Alignment.centerLeft,
                        width: ancho! * 0.4998335,
                        height: ancho! * 0.13482351,
                        child: AutoSizeText(
                          widget.texto!,
                          wrapWords: false,
                          // Para NO partir las palabras en 2
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 7.0,
                          maxFontSize: 40.0,
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      separador,
                      Container(
                        width: ancho! * 0.165834166,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: Theme.of(context).canvasColor,
                          size: ancho! * 0.075,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData? icono;
  final double? alto;
  final double? ancho;

  const _BotonGordoBackground(
      {required this.color1,
      required this.color2,
      required this.icono,
      required this.alto,
      required this.ancho});

  @override
  Widget build(BuildContext context) {
    final double radio = ancho! * 0.036764706;

    return Container(
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10.0)
          ],
          borderRadius: BorderRadius.circular(radio),
          gradient: LinearGradient(colors: <Color>[
            color1,
            color2,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radio),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: ancho! * 0.7738333333,
              bottom: ancho! * 0.1285,
              child: Container(
                width: ancho! * 0.312,
                height: ancho! * 0.251,
                child: FaIcon(
                  icono,
                  size: ancho! * 0.25,
                  color: Theme.of(context).canvasColor.withOpacity(0.25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
