import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';
import 'menu_app_bar_widget.dart';

class AppBarWidget extends StatefulWidget {
  final Map<String, MenuAppBarItem>? menuAcciones;

  const AppBarWidget({
    this.menuAcciones,
  });

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    double ancho = BlocCentral().size.width * 0.2;
    List<MenuAppBarItem> contenido = [];
    Widget contenido2 = Container(
      decoration: BoxDecoration(
          color: BlocCentral().theme.primaryColor, shape: BoxShape.circle),
      child: BlocCentral().cover,
    );

    double alto = BlocCentral().size.width * 0.2;
    double cerrar = 0;
    double leftC = ancho * 0.075;
    final anchoMenu = BlocCentral().size.width * 0.1725;

    if (BlocCentral().drawerMenu == true) {
      ancho = BlocCentral().size.width * 0.965;
      cerrar = 1;
      leftC = ancho * 0.025;

      // Contenido anterior
      contenido = <MenuAppBarItem>[];

      // Agregamos las funciones recibidas en la clase si las hay
      if (widget.menuAcciones != null) {
        widget.menuAcciones!.entries.forEach((element) {
          contenido.insert(0, element.value);
        });
      }

      contenido2 = ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
        child: Container(
          width: ancho - anchoMenu * 1.525,
          height: MediaQuery.of(context).size.width * 0.14,
          margin: EdgeInsets.only(
              left: anchoMenu * 1.26,
              top: MediaQuery.of(context).size.width * 0.035),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
              color: BlocCentral().theme.bottomAppBarColor),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            dragStartBehavior: DragStartBehavior.down,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: contenido,
            ),
          ),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        BounceInDown(
          duration: Duration(milliseconds: 2000),
          delay: Duration(milliseconds: 1200),
          child: AnimatedContainer(
            margin: EdgeInsets.only(top: alto * 0.25, left: leftC),
            duration: Duration(milliseconds: 1200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
              color: BlocCentral().theme.backgroundColor,
            ),
            padding: EdgeInsets.all(5.0),
            width: ancho,
            height: alto,
            child: Stack(
              children: <Widget>[
                contenido2,
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(alto * 0.5)),
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        BlocCentral().switchDrawer();
                      });
                    },
                    child: Container(
                      width: anchoMenu,
                      height: anchoMenu,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(alto * 0.5)),
                      ),
                      child: Stack(
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: cerrar,
                            duration: Duration(milliseconds: 800),
                            child: Container(
                              width: anchoMenu,
                              height: anchoMenu,
                              decoration: BoxDecoration(
                                color: BlocCentral().theme.bottomAppBarColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(alto * 0.5)),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
