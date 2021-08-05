import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../pages/loading_page.dart';

/// pantalla de procesamiento
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
        stream: BlocCentral().loadingStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data != '') {
              BlocCentral().processLoad = true;
              return LoadingPage();
            } else {
              BlocCentral().processLoad = false;
            }
          } else {
            BlocCentral().processLoad = false;
          }
          return Container(width: 1.0, height: 1.0);
        });
  }
}
