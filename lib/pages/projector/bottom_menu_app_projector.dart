import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../widgets/action_bottom_button_widget.dart';
import '../../widgets/bottom_actions_menu_widget.dart';

/// menu app inferior
class MenuAppInferior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, BotonAccionInferior>?>(
        stream: BlocCentral().actionButtonsStream,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, BotonAccionInferior>?> snapshot) {
          if (snapshot.data == null || snapshot.data!.length == 0) {
            return Container(
              width: 1.0,
              height: 1.0,
            );
          }

          return MenuInferiorGeneral();
        });
  }
}
