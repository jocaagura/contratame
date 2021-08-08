import 'package:flutter/material.dart';

class JocaaguraSliverCustomHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  JocaaguraSliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (maxHeight < minHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(JocaaguraSliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
