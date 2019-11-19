import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverOffset extends SingleChildRenderObjectWidget {
  const SliverOffset({
    Key key,
    Widget child,
    @required this.onChanged,
  }) : super(key: key, child: child);

  final ValueChanged<String> onChanged;

  @override
  RenderSliverOffset createRenderObject(BuildContext context) =>
      RenderSliverOffset(onChanged: onChanged);
}

class RenderSliverOffset extends RenderSliverSingleBoxAdapter {
  RenderSliverOffset({
    @required this.onChanged,
    RenderBox child,
  }) : super(child: child);

  ValueChanged<String> onChanged;

  @override
  void performLayout() {
    onChanged(constraints.scrollOffset.round().toString());
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
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    setChildParentData(child, constraints, geometry);
  }
}
