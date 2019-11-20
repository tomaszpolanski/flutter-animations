import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverOverlappingExample extends SingleChildRenderObjectWidget {
  const SliverOverlappingExample({
    Key key,
    @required this.layoutPercentage,
    Widget child,
  }) : super(key: key, child: child);

  final double layoutPercentage;

  @override
  RenderSliverOverlapping createRenderObject(BuildContext context) =>
      RenderSliverOverlapping(layoutPercentage);
}

class RenderSliverOverlapping extends RenderSliverSingleBoxAdapter {
  RenderSliverOverlapping(
    this.layoutPercentage, {
    RenderBox child,
  }) : super(child: child);

  final double layoutPercentage;

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child.size.width;
        break;
      case Axis.vertical:
        childExtent = child.size.height;
        break;
    }
    assert(childExtent != null);
    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0, to: childExtent);
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      layoutExtent: paintedChildSize * layoutPercentage,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    setChildParentData(child, constraints, geometry);
  }
}
