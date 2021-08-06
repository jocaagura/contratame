import 'package:flutter/material.dart';

import '../../../widgets/blueprint_home_widget.dart';
import '../blocs/bloc_bitcoin.dart';
import '../models/model_bitcoin_only_day.dart';

class DayDetailBPIPage extends StatelessWidget {
  const DayDetailBPIPage();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ModelBitcoinOnlyDay?>(
        stream: BlocBitcoin().modelBitcoinDayStream,
        builder: (context, snapshot) {
          final contenido = <Widget>[];
          if (snapshot.hasData) {
            contenido.add(Center(
              child: Column(
                children: [
                  Text(
                    'Probando: ${snapshot.data?.toJson()}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ));
          }

          return BlueprintHomeSliver(
            asset: 'assets/bitcoin/bitcoinconsulta.png',
            titulo: 'Detallado en pesos (COP) diario',
            listaItems: contenido,
          );
        });
  }
}
