import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import 'background_widget.dart';
import 'jocaagura_sliver_custom.dart';
import 'svg_proyector_widget.dart';

class BlueprintHomeSliver extends StatelessWidget {
  final String titulo;
  final List<Widget>? listaItems;
  final String? asset;

  const BlueprintHomeSliver({this.titulo = '', this.listaItems, this.asset});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaItems2 = [
      SizedBox(
        height: BlocCentral().size.height * 0.035,
      )
    ];
    if (listaItems != null) {
      if (listaItems!.length > 0) {
        listaItems!.forEach((element) {
          listaItems2.add(Container(
            alignment: Alignment.center,
            width: BlocCentral().size.width,
            child: element,
          ));
        });
      }
    }

    final double anchoRadio = BlocCentral().size.width * 0.5;

    return FondoWidget(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          /// Encabezado flexible para la plantilla
          SliverPersistentHeader(
              floating: true,
              delegate: JocaaguraSliverCustomHeaderDelegate(
                  minHeight: BlocCentral().size.height * 0.1,
                  maxHeight: BlocCentral().size.height * 0.3,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(anchoRadio),
                            bottomLeft: Radius.circular(anchoRadio),
                          ),
                          color: BlocCentral().theme.backgroundColor),
                      child: Stack(
                        children: [
                          asset != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(anchoRadio),
                                    bottomLeft: Radius.circular(anchoRadio),
                                  ),
                                  child: SvgProyectorWidget(svgasset: asset!))
                              : Container(),
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: anchoRadio,
                                height: BlocCentral().size.height * 0.05,
                                decoration: BoxDecoration(
                                    color: BlocCentral()
                                        .theme
                                        .backgroundColor
                                        .withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(
                                        anchoRadio * 0.05)),
                                child: AutoSizeText(
                                  titulo,
                                  minFontSize: 8.0,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                )),
                          ),
                        ],
                      )))),

          /// cuerpo de menus para la plantilla
          SliverList(
            delegate: SliverChildListDelegate(listaItems2,
                addRepaintBoundaries: true),
          )
        ],
      ),
    );
  }
}
