import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../blocs/bloc_provider.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/menu_app_bar_widget.dart';

/// menu de la aplicación
class MenuAppProjector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, MenuAppBarItem>>(
        stream: BlocCentral().menuItemsStream,
        builder: (context, snapshot) {
          if (BlocCentral().displayModo == 2 ||
              BlocCentral().displayModo == 4) {
            List<Widget> contenido = [];

            BlocCentral().menuItems.forEach((key, value) {
              contenido.insert(0, value);
            });

            contenido.insert(
                0,
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: BlocCentral().theme.primaryColorDark),
                  child: Container(child: BlocCentral().cover),
                ));

            if (BlocProvider().menuItems.length == 0) {
              contenido.add(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: BlocCentral().size.height * 0.25,
                      color: BlocCentral().theme.primaryColorDark,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Container(
                      height: BlocCentral().size.height * 0.25,
                    ),
                    Container(
                      height: BlocCentral().size.height * 0.15,
                      child: Center(
                        child: Text('Welcome'),
                      ),
                    )
                  ],
                ),
              );
            }

            return Drawer(
              child: Container(
                decoration:
                    BoxDecoration(color: BlocCentral().theme.accentColor),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: contenido,
                ),
              ),
            );
          }

          if (snapshot.data != null) {
            if (BlocCentral().drawerMenu == true &&
                BlocProvider().menuItems.entries.length > 0) {
              return AppBarWidget(
                menuAcciones: BlocProvider().menuItems,
              );
            }
          }
          return Container(
            width: 0.0,
            height: 0.0,
          );
        });
  }
}
