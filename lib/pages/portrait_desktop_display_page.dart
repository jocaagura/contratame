import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import 'projector/alert_projector_widget.dart';
import 'projector/base_projector_widget.dart';
import 'projector/bottom_menu_app_projector.dart';
import 'projector/loading_widget.dart';
import 'projector/menu_app_widget.dart';

class PortraitDesktopDisplayPage extends StatelessWidget {
  const PortraitDesktopDisplayPage();

  @override
  Widget build(BuildContext context) {
    final _blocCentral = BlocCentral();

    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: _blocCentral.sizeDrawer,
              height: _blocCentral.size.height,
              child: MenuAppProjector(),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    /// base proyector
                    BaseProjector(),

                    /// Menú inferior
                    MenuAppInferior(),
                  ],
                ),
              ),
            )
          ],
        ),

        /// Cargado o procesador
        LoadingWidget(),

        /// alerta widget
        AlertProjectorWidget()
      ],
    );
  }
}
