import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

/// Widget for present alerts info
class AlertProjectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Widget?>(
        stream: BlocCentral().alertStream,
        builder: (context, snapshot) {
          return snapshot.data ??
              Container(
                width: 1.0,
                height: 1.0,
              );
        });
  }
}
