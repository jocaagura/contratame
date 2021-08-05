import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../widgets/blueprint_home_widget.dart';
import 'models/model_bitcoin_resume.dart';

class BitCoinHomePage extends StatelessWidget {
  const BitCoinHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocCentral().jsonGetRequestHttp(
          url: 'https://api.coindesk.com/v1/bpi/historical/close.json'),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasData) {
          final modelBitcoin = ModelBitcoin.fromJson(snapshot.data!);
          final contenido = <Widget>[];
          modelBitcoin.bpi.forEach((key, value) {
            contenido.add(FadeInLeft(
              duration: Duration(milliseconds: 450),
              child: ListTile(
                title: Text('$key'),
                subtitle: Text('\$$value'),
              ),
            ));
          });

          return BlueprintHomeSliver(
            titulo: 'Resumen de las ultimas dos semanas',
            listaItems: contenido,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
