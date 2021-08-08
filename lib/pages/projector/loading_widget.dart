import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../pages/loading_page.dart';

/// process Screen
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    return StreamBuilder<String?>(
        stream: _blocCentral.loadingStream,
        builder: (context, snapshot) {
          if (snapshot.data?.isNotEmpty == true) {
            _blocCentral.processLoad = true;
            return LoadingPage();
          }
          _blocCentral.processLoad = false;
          return Container(width: 1.0, height: 1.0);
        });
  }
}
