import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';
import '../enums.dart';

class MenuAppBarItem extends StatelessWidget {
  final Function funcion;
  final int inicio;
  final IconData? icono;
  final String label;

  const MenuAppBarItem(
      {required this.funcion,
      this.inicio = 2000,
      this.icono = FontAwesomeIcons.font,
      this.label = '1'});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.width * 0.2;
    double anchoMenu = MediaQuery.of(context).size.width * 0.125;
    int inicio2 = inicio;
    if (inicio2 < 800) {
      inicio2 = 800;
    }
    if (BlocCentral().displayModo == ModoDisplay.tablet ||
        BlocCentral().displayModo == ModoDisplay.tv) {
      anchoMenu = BlocCentral().sizeDrawer * 0.96;
      alto = BlocCentral().size.height * 0.1;

      return FadeInUp(
        from: 300,
        duration: Duration(milliseconds: (inicio * 0.9).floor()),
        delay: Duration(milliseconds: (inicio * 0.05).floor()),
        child: BounceInDown(
          duration: Duration(milliseconds: inicio),
          delay: Duration(milliseconds: (inicio * 0.25).floor()),
          from: 300,
          child: ZoomIn(
            duration: Duration(milliseconds: inicio),
            delay: Duration(milliseconds: (inicio * 0.45).floor()),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
              child: RawMaterialButton(
                onPressed: () {
                  BlocCentral().drawerMenu = false;
                  BlocCentral().reloadMenuItems();
                  funcion();
                },
                child: Container(
                  width: anchoMenu,
                  height: alto,
                  decoration: BoxDecoration(
                      color: BlocCentral().theme.accentColor,
                      border: Border(
                          bottom: BorderSide(
                              width: 2.0,
                              color: BlocCentral().theme.buttonColor))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: anchoMenu * 0.08,
                        ),
                        Container(
                          width: anchoMenu * 0.15,
                          height: alto,
                          alignment: Alignment.centerLeft,
                          child: FaIcon(
                            icono,
                            size: anchoMenu * 0.1,
                            color: BlocCentral().theme.primaryColorDark,
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: anchoMenu * 0.6,
                            height: alto * 0.8,
                            child: AutoSizeText(
                              label,
                              overflow: TextOverflow.ellipsis,
                              minFontSize: 4,
                              maxFontSize: 30.0,
                              style: TextStyle(
                                  fontSize: alto * 0.2,
                                  color: BlocCentral().theme.primaryColor),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return FadeInLeft(
      from: 300,
      duration: Duration(milliseconds: (inicio * 0.9).floor()),
      delay: Duration(milliseconds: (inicio * 0.05).floor()),
      child: BounceInDown(
        duration: Duration(milliseconds: inicio),
        delay: Duration(milliseconds: (inicio * 0.25).floor()),
        from: 300,
        child: ZoomIn(
          duration: Duration(milliseconds: inicio),
          delay: Duration(milliseconds: (inicio * 0.45).floor()),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
            child: RawMaterialButton(
              onPressed: () {
                BlocCentral().drawerMenu = false;
                BlocCentral().reloadMenuItems();

                funcion();
              },
              child: Container(
                width: anchoMenu,
                height: anchoMenu,
                decoration: BoxDecoration(
                  color: BlocCentral().theme.primaryColorDark,
                  borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(
                        icono,
                        size: anchoMenu * 0.3,
                        color: BlocCentral().theme.backgroundColor,
                      ),
                      SizedBox(
                        height: anchoMenu * 0.075,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: anchoMenu * 0.7,
                          height: anchoMenu * 0.25,
                          child: AutoSizeText(
                            label,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 4,
                            maxFontSize: 12,
                            style: TextStyle(
                                fontSize: 30.0,
                                color: BlocCentral().theme.backgroundColor),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
