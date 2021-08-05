import 'package:flutter/material.dart';

import 'fondo_1x2.dart';
import 'fondo_1x3.dart';
import 'fondo_avatar.dart';
import 'fondo_horizontal.dart';
import 'fondo_vertical.dart';

class PlantillaFondoWidgets extends StatelessWidget {
  final Widget? avatar;
  final Widget? horizontal;
  final Widget? vertical;
  final Widget? banner2x;
  final Widget? banner3x;
  final Color? color;

  const PlantillaFondoWidgets(
      {this.avatar,
      this.horizontal,
      this.vertical,
      this.banner2x,
      this.banner3x,
      this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints limites) {
        final Size size = Size(limites.maxWidth, limites.maxHeight);

        if (size.width == size.height) {
          return BannerAvatar(
              color: color,
              size: size,
              child: avatar,);
        }

        if (size.height == size.width / 3) {
          return Banner3x(
            color: color,
              size: size,
              child: banner3x,);
        }

        if (size.height == size.width / 2) {
          return Banner2x(
            color: color,
              size: size,
              child: banner2x,);
        }

        if (size.width > size.height) {
          return BannerHorizontal(
              color: color,
              size: size,
              child: horizontal,);
        }

        return BannerVertical(
          color: color,
            size: size,
            child: vertical,);
      },
    );
  }
}
