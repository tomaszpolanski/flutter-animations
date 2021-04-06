import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverValueChanged extends SingleChildRenderObjectWidget {
  const SliverValueChanged({
    Key? key,
    Widget? child,
    this.onConstraintsChanged,
    this.onGeometryChanged,
  })  : assert(onConstraintsChanged != null || onGeometryChanged != null),
        super(key: key, child: child);

  final ValueChanged<SliverConstraints>? onConstraintsChanged;
  final ValueChanged<SliverGeometry>? onGeometryChanged;

  @override
  RenderSliverExample createRenderObject(BuildContext context) =>
      RenderSliverExample(
        onConstraintsChanged: onConstraintsChanged,
        onGeometryChanged: onGeometryChanged,
      );
}

class RenderSliverExample extends RenderSliverSingleBoxAdapter {
  RenderSliverExample({
    required this.onConstraintsChanged,
    required this.onGeometryChanged,
    RenderBox? child,
  }) : super(child: child);

  final ValueChanged<SliverConstraints>? onConstraintsChanged;
  final ValueChanged<SliverGeometry>? onGeometryChanged;

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    double? childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }
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
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    if (onConstraintsChanged != null) {
      onConstraintsChanged!(constraints);
    }
    final onGeo = onGeometryChanged;
    final geo = geometry;
    if (onGeo != null && geo != null)  {
      onGeo(geo);
    }
    setChildParentData(child!, constraints, geometry!);
  }
}
