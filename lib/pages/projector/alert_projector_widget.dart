import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

/// Widget de alerta
class AlertProjectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Widget?>(
        stream: BlocCentral().alertStream,
        builder: (context, snapshot) {

          if (snapshot.data != null) {
            print(snapshot.data);
            return snapshot.data!;
          }
          return Container(
            width: 1.0,
            height: 1.0,
          );
        });
  }
}
