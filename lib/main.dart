import 'package:flutter/material.dart';

import './pages/landing_page.dart';
import '../../blocs/bloc_central.dart';

void main() {
  runApp(MyApp());
  //PARA APPS EN UNICAMENTE VERTICAL
  // try {
  //   // Generamos el bloqueo de pantalla para que se vea unicamente vertical
  //   SystemChrome.setPreferredOrientations(
  //           [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //       .then((e) {});
  // } catch (e) {}
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        stream: BlocCentral().streamTheme,
        builder: (context, snapshot) {
          ThemeData themeData = ThemeData(
            primarySwatch: Colors.purple,
          );
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              themeData = snapshot.data!;
            }
          }

          return MaterialApp(
            title: 'Portfolio Albert J. Jiménez P.',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: LandingPage(),
          );
        });
  }
}
