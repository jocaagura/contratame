import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/bloc_central.dart';
import '../../widgets/blueprint_home_widget.dart';
import 'models/model_bitcoin_resume.dart';

class BitCoinHomePage extends StatelessWidget {
  const BitCoinHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTitulo = GoogleFonts.openSans(
        fontSize: BlocCentral().size.width * 0.02, fontStyle: FontStyle.italic);
    final textStyleSubTitulo = GoogleFonts.openSans(
        fontSize: BlocCentral().size.width * 0.0225,
        fontWeight: FontWeight.bold);

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
                onTap: () {
                  BlocCentral().generalAlert('Detalle',
                      'Aqui mostraremos el detalle de la moneda en USD, EUR y COP');
                },
                tileColor: BlocCentral().theme.backgroundColor,
                leading: Icon(
                  BlocCentral().returnIcondata('money'),
                  color: BlocCentral().theme.cardColor,
                ),
                trailing: Icon(
                  BlocCentral().returnIcondata('goDown'),
                  color: BlocCentral().theme.cardColor,
                ),
                title: Text('$key', style: textStyleTitulo),
                subtitle: Text('USD \$$value', style: textStyleSubTitulo),
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
