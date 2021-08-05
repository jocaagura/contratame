import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import 'landscape_tablet_display_page.dart';
import 'portrait_desktop_display_page.dart';
import 'portrait_movil_display_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage();

  /// This is the main activity for the app
  /// Here we control the display and how the content is presented to the final user
  ///

  @override
  Widget build(BuildContext context) {
    /// We catch the size of the document to use it form ThemeData class
    BlocCentral().size = MediaQuery.of(context).size;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          BlocCentral().back();
          return Future.value(false);
        },
        child: StreamBuilder<Size?>(
            stream: BlocCentral().sizeStream,
            builder: (context, snapshot) {
              switch (BlocCentral().displayModo) {
                case 2:
                  return LandscapeTabletDisplayPage();
                case 3:
                  return PortraitDesktopDisplayPage();
                default:
                  return PortraitMovilDisplayPage();
              }
            }),
      ),
    );
  }
}
