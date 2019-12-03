import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomSliverFillRemaining extends SingleChildRenderObjectWidget {
  const CustomSliverFillRemaining({
    Key key,
    Widget child,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
  })  : assert(hasScrollBody != null),
        super(key: key, child: child);

  final bool hasScrollBody;
  final bool fillOverscroll;

  @override
  _RenderSliverFillRemaining createRenderObject(BuildContext context) {
    return _RenderSliverFillRemaining(
      hasScrollBody: hasScrollBody,
      fillOverscroll: fillOverscroll,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderSliverFillRemaining renderObject) {
    renderObject
      ..hasScrollBody = hasScrollBody
      ..fillOverscroll = fillOverscroll;
  }
}

class _RenderSliverFillRemaining extends RenderSliverSingleBoxAdapter {
  _RenderSliverFillRemaining({
    RenderBox child,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
  })  : assert(hasScrollBody != null),
        super(child: child);

  bool hasScrollBody;
  bool fillOverscroll;

  @override
  void performLayout() {
    double childExtent;
    // how big is the viewport - where in the scrollview the sliver is positioned
    double extent =
        constraints.viewportMainAxisExtent - constraints.precedingScrollExtent;
    // remaining starts with 0 until a first pixel is visible, then goes upt to viewport size
    double maxExtent =
        constraints.remainingPaintExtent - math.min(constraints.overlap, 0.0);

    if (hasScrollBody) {
      extent = maxExtent;
      if (child != null) {
        child.layout(
          constraints.asBoxConstraints(
            minExtent: extent,
            maxExtent: extent,
          ),
          parentUsesSize: true,
        );
      }
    } else if (child != null) {
      switch (constraints.axis) {
        case Axis.horizontal:
          childExtent = child.getMaxIntrinsicWidth(constraints.crossAxisExtent);
          break;
        case Axis.vertical:
          childExtent =
              child.getMaxIntrinsicHeight(constraints.crossAxisExtent);
          break;
      }

      if (constraints.precedingScrollExtent >
              constraints.viewportMainAxisExtent ||
          childExtent > extent) {
        extent = childExtent;
      }
      if (maxExtent < extent) {
        maxExtent = extent;
      }
      if ((fillOverscroll ? maxExtent : extent) > childExtent) {
        child.layout(
          constraints.asBoxConstraints(
            minExtent: extent,
            maxExtent: fillOverscroll ? maxExtent : extent,
          ),
          parentUsesSize: true,
        );
      } else {
        child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
      }
    }

    assert(
      extent.isFinite,
      'The calculated extent for the child of SliverFillRemaining is not finite.'
      'This can happen if the child is a scrollable, in which case, the'
      'hasScrollBody property of SliverFillRemaining should not be set to'
      'false.',
    );
    final double paintedChildSize = calculatePaintOffset(
      constraints,
      from: 0,
      to: extent,
    );
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      scrollExtent: hasScrollBody ? constraints.viewportMainAxisExtent : extent,
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      hasVisualOverflow: extent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    if (child != null) {
      setChildParentData(child, constraints, geometry);
    }
  }
}
