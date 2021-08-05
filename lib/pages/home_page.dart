import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import '../modules/bitcoin/bit_coin_home_page.dart';
import '../modules/users/users_home_page.dart';
import '../widgets/blueprint_home_widget.dart';
import '../widgets/fat_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return BlueprintHomeSliver(
      titulo: 'Home page testing app',
      listaItems: [
        /// todo: create autation for inverse injection for home page pages
        FatButtonJocaagura(
            icono: BlocCentral().returnIcondata('money'),
            texto: 'Test Bitcoin api',
            onTap: () {
              /// Rout to bit coin api
              BlocCentral().addPage('BitCoinHomePage', BitCoinHomePage());
            }),
        FatButtonJocaagura(
            icono: BlocCentral().returnIcondata('go'),
            texto: 'Test users api',
            onTap: () {
              BlocCentral().addPage('HomeUserPage', HomeUserPage());
            })
      ],
    );
  }
}
