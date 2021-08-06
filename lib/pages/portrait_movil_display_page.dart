import 'package:flutter/material.dart';

import 'projector/menu_app_widget.dart';
import 'projector/base_projector_widget.dart';
import 'projector/alert_projector_widget.dart';
import 'projector/bottom_menu_app_projector.dart';
import 'projector/loading_widget.dart';


class PortraitMovilDisplayPage extends StatelessWidget {
  const PortraitMovilDisplayPage();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          /// base proyector
          BaseProjector(),

          /// menuApp
          MenuAppProjector(),

          /// Menú inferior
          MenuAppInferior(),

          /// Cargado o procesador
          LoadingWidget(),

          /// alerta widget
          AlertProjectorWidget()
        ],
      );
  }
}
