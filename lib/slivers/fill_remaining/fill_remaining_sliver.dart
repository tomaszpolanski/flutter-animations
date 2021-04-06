import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomSliverFillRemaining extends SingleChildRenderObjectWidget {
  const CustomSliverFillRemaining({
    Key? key,
    Widget? child,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
  }) : super(key: key, child: child);

  final bool hasScrollBody;

  /// This allows on iOS for the child to grow when you do an over-scroll
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
    RenderBox? child,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
  }) : super(child: child);

  bool hasScrollBody;
  bool fillOverscroll;

  @override
  void performLayout() {
    /// The size of the child
    double? childExtent;

    /// viewportMainAxisExtent size of the viewport
    /// precedingScrollExtent how far is the sliver in the scrollview

    /// The value is negative when sliver is no yet visible
    /// and positive if it's withing the view port.
    /// This is the smallest size of the sliver:
    /// - if sliver won't fit the visible space because either child is bigger
    ///   than available space
    /// - OR previous slivers pushes the sliver outside so it's fills the remaining
    ///   space which is zero but still it needs to display the child
    double? extent =
        constraints.viewportMainAxisExtent - constraints.precedingScrollExtent;

    /// remainingPaintExtent starts with 0 until a first pixel of the sliver is visible,
    /// then goes up to viewport size
    /// This is the maximum size how big can be our widget - it cannot be bigger
    /// than the viewport
    /// In case of iOS over-scroll it can grow to be bigger than the extent
    double? maxExtent =
        constraints.remainingPaintExtent - math.min(constraints.overlap, 0.0);

    if (hasScrollBody) {
      extent = maxExtent;
      if (child != null) {
        child!.layout(
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
          childExtent =
              child!.getMaxIntrinsicWidth(constraints.crossAxisExtent);
          break;
        case Axis.vertical:

          /// crossAxisExtent is here ScrollView's width
          childExtent =
              child!.getMaxIntrinsicHeight(constraints.crossAxisExtent);
          break;
      }

      /// precedingScrollExtent how far is the sliver in the scrollview
      /// viewportMainAxisExtent size of the viewport
      /// Checks if the sliver is outside of the visible viewport
      /// OR sliver's size is smaller than it's child's size
      if (constraints.precedingScrollExtent >
              constraints.viewportMainAxisExtent ||
          childExtent > extent) {
        /// Make the sliver as big as the child
        extent = childExtent;
      }

      /// Checks if sliver's maximum size is smaller than it's minimum size
      /// This allows the sliver to go outside the viewport if child does not fit
      /// the viewport
      if (maxExtent < extent) {
        maxExtent = extent;
      }

      /// In case iOS-like overscroll behavior is enabled, we need to allow
      /// the child to grow to match the overscroll
      if ((fillOverscroll ? maxExtent : extent) > childExtent) {
        child!.layout(
          constraints.asBoxConstraints(
            minExtent: extent,
            maxExtent: fillOverscroll ? maxExtent : extent,
          ),
          parentUsesSize: true,
        );
      } else {
        /// No need for the child to handle overscroll
        child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
      }
    }

    assert(
      extent.isFinite,
      'The calculated extent for the child of SliverFillRemaining is not finite. '
      'This can happen if the child is a scrollable, in which case, the '
      'hasScrollBody property of SliverFillRemaining should not be set to '
      'false.',
    );

    /// Calculate Sliver's paint size
    final double paintedChildSize = calculatePaintOffset(
      constraints,
      from: 0,
      to: extent,
    );
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);

    geometry = SliverGeometry(
      /// When the content of the Sliver's is scrollable, then it's size is
      /// as big as the viewport
      scrollExtent: hasScrollBody ? constraints.viewportMainAxisExtent : extent,
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      hasVisualOverflow: extent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    if (child != null) {
      setChildParentData(child!, constraints, geometry!);
    }
  }
}
