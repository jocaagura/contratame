import 'package:flutter/material.dart';

class JocaaguraSliverCustomHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minAlto;
  final double maxAlto;
  final Widget child;

  JocaaguraSliverCustomHeaderDelegate(
      {required this.minAlto, required this.maxAlto, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (maxAlto < minAlto) ? minAlto : maxAlto;

  @override
  double get minExtent => minAlto;

  @override
  bool shouldRebuild(JocaaguraSliverCustomHeaderDelegate oldDelegate) {
    return maxAlto != oldDelegate.maxAlto ||
        minAlto != oldDelegate.minAlto ||
        child != oldDelegate.child;
  }
}
