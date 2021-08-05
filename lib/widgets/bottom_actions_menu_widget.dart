import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class MenuInferiorGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4.0,
      left: BlocCentral().size.width * 0.05,
      child: FadeInUp(
        duration: Duration(milliseconds: 800),
        child: ZoomIn(
          duration: Duration(milliseconds: 800),
          child: Container(
            width: BlocCentral().size.width * 0.9,
            height: BlocCentral().size.height * 0.1,
            decoration: BoxDecoration(
                color: BlocCentral().theme.accentColor.withOpacity(0.25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: BlocCentral().actionButtons.values.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
