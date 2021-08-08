import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/bloc_central.dart';

class KeyboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    return Container(
      width: _blocCentral.size.width,
      height: _blocCentral.size.height * 0.35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Center(
        child: FaIcon(FontAwesomeIcons.keyboard),
      ),
    );
  }
}
