import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverConstraintsExample extends SingleChildRenderObjectWidget {
  const SliverConstraintsExample({
    Key key,
    Widget child,
    @required this.onChanged,
  }) : super(key: key, child: child);

  final ValueChanged<SliverConstraints> onChanged;

  @override
  RenderSliverConstraints createRenderObject(BuildContext context) =>
      RenderSliverConstraints(onChanged: onChanged);
}

class RenderSliverConstraints extends RenderSliverSingleBoxAdapter {
  RenderSliverConstraints({
    @required this.onChanged,
    RenderBox child,
  }) : super(child: child);

  final ValueChanged<SliverConstraints> onChanged;

  @override
  void performLayout() {
    onChanged(constraints);
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
