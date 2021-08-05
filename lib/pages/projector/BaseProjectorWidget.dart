import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../pages/home_page.dart';

/// proyector de navegación para la aplicación
class BaseProjector extends StatelessWidget {
  const BaseProjector();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, Widget>?>(
        stream: BlocCentral().navigatorMapStream,
        builder: (context, snapshot) {
          Widget? pagina = HomePage();

          if (snapshot.data != null) {
            if (snapshot.data!.length > 0) {
              pagina = snapshot.data![BlocCentral().historial.last];
            }
          }
          return FadeIn(
            duration: Duration(milliseconds: 400),
            child: Container(
              width: BlocCentral().size.width,
              height: BlocCentral().size.height,
              child: pagina, // Widget base en el proyector,
            ),
          );
        });
  }
}
