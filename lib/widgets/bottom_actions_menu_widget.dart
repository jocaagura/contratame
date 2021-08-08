import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class MenuInferiorGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    return Positioned(
      bottom: 4.0,
      left: _blocCentral.size.width * 0.05,
      child: FadeInUp(
        duration: Duration(milliseconds: 800),
        child: ZoomIn(
          duration: Duration(milliseconds: 800),
          child: Container(
            width: _blocCentral.size.width * 0.9,
            height: _blocCentral.size.height * 0.1,
            decoration: BoxDecoration(
                color: _blocCentral.theme.accentColor.withOpacity(0.25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: _blocCentral.actionButtons.values.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
