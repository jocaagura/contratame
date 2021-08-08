import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:contratame/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';

class FatButtonJocaagura extends StatefulWidget {
  final IconData? icon;
  final String? label;
  final Color? primaryColor;
  final Color? accentColor;
  final Function onTap;
  final String? soundAssetsRoute;
  final double? buttonWidth;
  final String? securityAccessKey;

  const FatButtonJocaagura(
      {required this.icon,
      required this.label,
      required this.onTap,
      this.primaryColor,
      this.accentColor,
      this.soundAssetsRoute,
      this.buttonWidth,
      this.securityAccessKey});

  @override
  _FatButtonJocaaguraState createState() => _FatButtonJocaaguraState();
}

class _FatButtonJocaaguraState extends State<FatButtonJocaagura> {
  double aspectRatio = 1 / 3.03;

  @override
  void initState() {
    super.initState();
    aspectRatio = 1 / 3.03;
  }

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    String acceso = widget.securityAccessKey ?? '';
    if (_blocCentral.ckeckPolicyAccsess(acceso) == false) {
      return Container(
        width: 1,
        height: 1,
      );
    }

    double width = widget.buttonWidth ?? _blocCentral.size.width * 0.85;
    double height = (width * aspectRatio).clamp(50, 130);

    if (_blocCentral.displayModo == ModoDisplay.tablet) {
      width = _blocCentral.size.width * 0.5;
    }

    Widget separador = SizedBox(
      width: width * 0.011988012,
    );

    return FadeInLeft(
      duration: Duration(milliseconds: 250),
//      delay: Duration(milliseconds: 100),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.bounceOut,
        width: width,
        margin: EdgeInsets.all(width * 0.01),
        child: InkWell(
          onTap: () {
            if (widget.soundAssetsRoute != null) {
              /// todo: complete audio functions
            }
            setState(() {
              double tmpWidth = _blocCentral.size.width * 0.9;
              if (width * 1.2 < tmpWidth) {
                tmpWidth = width * 1.2;
              }
              if (width != tmpWidth) {
                width = tmpWidth;
              } else {
                width = widget.buttonWidth ?? _blocCentral.size.width * 0.85;
              }
            });
            widget.onTap();
          },
          child: Stack(
            children: <Widget>[
              _FatButtonBackground(
                color1: widget.primaryColor ?? _blocCentral.theme.primaryColor,
                color2: widget.accentColor ?? _blocCentral.theme.accentColor,
                icono: widget.icon ?? Icons.warning,
                alto: height,
                ancho: width,
              ),
              Container(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.070887446,
                      ),
                      Container(
                        width: width * 0.165834166,
                        alignment: Alignment.center,
                        child: FaIcon(
                          widget.icon,
                          color: _blocCentral.theme.accentColor,
                          size: width * 0.13,
                        ),
                      ),
                      separador,
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 0.4998335,
                        height: width * 0.13482351,
                        child: AutoSizeText(
                          widget.label ?? 'I am FatButton',
                          wrapWords: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 7.0,
                          maxFontSize: 40.0,
                          style: TextStyle(
                              color: _blocCentral.theme.buttonColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      separador,
                      Container(
                        width: width * 0.165834166,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: _blocCentral.theme.canvasColor,
                          size: width * 0.075,
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

class _FatButtonBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icono;
  final double alto;
  final double ancho;

  const _FatButtonBackground(
      {required this.color1,
      required this.color2,
      required this.icono,
      required this.alto,
      required this.ancho});

  @override
  Widget build(BuildContext context) {
    final double radio = ancho * 0.036764706;
    final BlocCentral _blocCentral = BlocCentral();

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
              left: ancho * 0.7738333333,
              bottom: ancho * 0.1285,
              child: Container(
                width: ancho * 0.312,
                height: ancho * 0.251,
                child: FaIcon(
                  icono,
                  size: ancho * 0.25,
                  color: _blocCentral.theme.canvasColor.withOpacity(0.25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
