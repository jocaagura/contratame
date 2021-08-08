import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../pages/home_page.dart';

/// navigator project for the app
class BaseProjector extends StatelessWidget {
  const BaseProjector();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, Widget>?>(
        stream: BlocCentral().navigatorMapStream,
        builder: (context, snapshot) {
          Widget? page = snapshot.data?[BlocCentral().historial.last] ?? HomePage();
          return FadeIn(
            duration: Duration(milliseconds: 400),
            child: Container(
              /// Bloc Central is singleton class and has only one instance
              width: BlocCentral().size.width,
              height: BlocCentral().size.height,
              child: page, // Widget base en el proyector,
            ),
          );
        });
  }
}
