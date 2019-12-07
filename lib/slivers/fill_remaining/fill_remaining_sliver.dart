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

    /// viewportMainAxisExtent size of the viewport
    /// precedingScrollExtent how far is the sliver in the scrollview
    /// Check how many pixels the has until it's not visible
    /// The value is negative when sliver is no yet visible without scrolling (how many pixels to be visible)
    /// and positive if it's withing the view port without scrolling
    double extent =
        constraints.viewportMainAxisExtent - constraints.precedingScrollExtent;

    /// remainingPaintExtent starts with 0 until a first pixel of the sliver is visible,
    /// then goes up to viewport size
    /// This is the maximum size how big can be our widget - it cannot be bigger
    /// than the viewport
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
      /// Body is not scrollable
      switch (constraints.axis) {
        case Axis.horizontal:

          /// crossAxisExtent is here ScrollView's height
          childExtent = child.getMaxIntrinsicWidth(constraints.crossAxisExtent);
          break;
        case Axis.vertical:

          /// crossAxisExtent is here ScrollView's width
          childExtent =
              child.getMaxIntrinsicHeight(constraints.crossAxisExtent);
          break;
      }

      /// precedingScrollExtent how far is the sliver in the scrollview
      /// viewportMainAxisExtent size of the viewport
      /// Checks if the sliver is outside of the visible viewport
      /// OR sliver's size is smaller than it's child's size (is that needed?)
      if (constraints.precedingScrollExtent >
              constraints.viewportMainAxisExtent ||
          childExtent > extent) {
        /// Make the sliver as big as the child
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
