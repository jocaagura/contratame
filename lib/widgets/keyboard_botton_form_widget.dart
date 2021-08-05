import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KeyboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Center(
        child: FaIcon(FontAwesomeIcons.keyboard),
      ),
    );
  }
}