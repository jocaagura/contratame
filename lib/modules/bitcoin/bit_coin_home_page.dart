import 'package:animate_do/animate_do.dart';
import 'package:contratame/modules/bitcoin/blocs/bloc_bitcoin.dart';
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

          /// add the main part and disclaimer
          contenido.add(FadeInLeft(
            duration: Duration(milliseconds: 450),
            child: ListTile(
              tileColor: BlocCentral().theme.backgroundColor,
              leading: Icon(
                BlocCentral().returnIcondata('calendario'),
                color: BlocCentral().theme.cardColor,
              ),
              trailing: Icon(
                BlocCentral().returnIcondata('go'),
                color: BlocCentral().theme.cardColor,
              ),
              title: Text(
                  'Consulta realizada el ${modelBitcoin.time.updatedIso}',
                  style: textStyleTitulo.copyWith(
                      color: BlocCentral().theme.errorColor)),
              subtitle:
                  Text('${modelBitcoin.disclaimer}', style: textStyleSubTitulo),
            ),
          ));

          final contenido2 = <Widget>[];
          contenido.add(Container(
            width: BlocCentral().size.width,
            height: BlocCentral().size.height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                children: contenido2,
              ),
            ),
          ));

          modelBitcoin
              .returnAfterDate(DateTime.now().subtract(Duration(days: 15)))
              .forEach((key, value) {
            contenido2.add(FadeInLeft(
              duration: Duration(milliseconds: 450),
              child: ListTile(
                onTap: () {
                  final inCOP = BlocBitcoin().returnUSDtoCopValue(value).toStringAsFixed(2);
                  final inEUR = BlocBitcoin().returnUSDtoEURValue(value).toStringAsFixed(2);
                  BlocCentral().generalAlert('Detalle',
                      'Para el $key\nEl valor en USD fue de ${BlocCentral().returnMoneyFormat(value.toStringAsFixed(2))}\n'
                      'El valor calculado aprox en COP fue de ${BlocCentral().returnMoneyFormat(inCOP)}\n'
                      'El valor calculado aprox en EUR fue de EUR ${BlocCentral().returnMoneyFormat(inEUR)}');
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
                subtitle: Text('USD ${BlocCentral().returnMoneyFormat(value.toStringAsFixed(4))}', style: textStyleSubTitulo),
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
