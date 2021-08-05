import '../../blocs/bloc_central.dart';
import 'package:flutter/material.dart';

class BannerAvatar extends StatelessWidget {
  final Widget? child;
  final Size? size;
  final Color? color;

  const BannerAvatar({
    this.size,
    this.child,
    this.color
  });


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size!.width * 0.5),
      child: Container(
        width: size!.width,
        height: size!.height,
        color: color ?? BlocCentral().theme.canvasColor,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}