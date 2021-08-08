import 'package:flutter/material.dart';

class BlueprintScreenWidgets extends StatelessWidget {
  final Widget avatar;
  final Widget horizontal;
  final Widget vertical;
  final Widget banner2x;
  final Widget banner3x;

  const BlueprintScreenWidgets(
      {required this.avatar,
      required this.horizontal,
      required this.vertical,
      required this.banner2x,
      required this.banner3x});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints limites) {
        final Size size = Size(limites.maxWidth, limites.maxHeight);

        if (size.width == size.height) {
          return avatar;
        }

        if (size.height == size.width / 3) {
          return banner3x;
        }

        if (size.height == size.width / 2) {
          return banner2x;
        }

        if (size.width > size.height) {
          return horizontal;
        }

        return vertical;
      },
    );
  }
}
