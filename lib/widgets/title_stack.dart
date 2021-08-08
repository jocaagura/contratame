import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class TitleStackWidget extends StatelessWidget {
  final String? title;

  const TitleStackWidget({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    if (title == null) {
      return Container(
        width: 1.0,
        height: 1.0,
      );
    }

    return Positioned(
      right: 0.0,
      top: 10.0,
      height: _blocCentral.size.height * 0.075,
      width: _blocCentral.size.width * 0.5,
      child: FadeInLeft(
        duration: Duration(milliseconds: 2500),
        delay: Duration(milliseconds: 1500),
        child: Container(
          decoration: BoxDecoration(
              color: _blocCentral.theme.backgroundColor.withAlpha(180),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))),
          child: Center(
              child: AutoSizeText(
            title ?? '',
            style: TextStyle(fontSize: 16),
          )),
        ),
      ),
    );
  }
}
