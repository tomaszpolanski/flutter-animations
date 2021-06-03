// ignore_for_file: prefer_single_quotes
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/shared/enum.dart';
import 'package:animation_cheat_page/slivers/constraints/slivers_constraints_page.dart'
    deferred as constraints;
import 'package:animation_cheat_page/slivers/shared/overlapping.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:animation_cheat_page/slivers/single_page.dart'
    deferred as single;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const description = '''
This page explains in an interactive way how 
different **SliverConstraints** describe Slivers.''';

final sliverExamples = <SliverSectionData<SliverConstraints>>[
  SliverSectionData(
    title: 'userScrollDirection',
    description:
        "The direction in which the user is attempting to scroll, relative to the "
        "**axisDirection** and **growthDirection**.",
    mapper: (constraints) => fromEnum(constraints.userScrollDirection),
  ),
  SliverSectionData(
    title: 'scrollOffset',
    description: "The scroll offset, in this sliver's coordinate "
        "system, that corresponds to the earliest visible part of this sliver in "
        "the **AxisDirection** if **growthDirection** is **GrowthDirection.forward** "
        "or in the opposite **AxisDirection** direction if **growthDirection** "
        "is **GrowthDirection.reverse**.",
    mapper: (constraints) => constraints.scrollOffset.round(),
  ),
  SliverSectionData(
    title: 'precedingScrollExtent',
    description:
        "The scroll distance that has been consumed by all **Sliver**s that came "
        "before this **Sliver**.",
    mapper: (constraints) => constraints.precedingScrollExtent.round(),
  ),
  SliverSectionData(
    title: 'overlap',
    description:
        "The number of pixels from where the pixels corresponding to the "
        "**scrollOffset** will be painted up to the first pixel that has not yet been "
        "painted on by an earlier sliver, in the **axisDirection**.",
    leading: const SliverOverlappingExample(
      layoutPercentage: 0.8,
      child: Placeholder(fallbackHeight: 100),
    ),
    mapper: (constraints) => constraints.overlap.round(),
  ),
  SliverSectionData(
    title: 'remainingPaintExtent',
    description:
        "The number of pixels of content that the sliver should consider providing."
        "\n(Providing more pixels than this is inefficient.)\n"
        "The actual number of pixels provided should be specified in the "
        "**RenderSliver.geometry** as **SliverGeometry.paintExtent**.",
    mapper: (constraints) => constraints.remainingPaintExtent.round(),
  ),
  SliverSectionData(
    title: 'crossAxisExtent',
    description: 'The number of pixels in the cross-axis.\n'
        'For a vertical list, this is the width of the sliver.',
    mapper: (constraints) => constraints.crossAxisExtent.round(),
  ),
  SliverSectionData(
    title: 'viewportMainAxisExtent',
    description:
        "The number of pixels the viewport can display in the main axis.",
    mapper: (constraints) => constraints.viewportMainAxisExtent.round(),
  ),
  SliverSectionData(
    title: 'cacheOrigin',
    description: "Where the cache area starts relative to the **scrollOffset**",
    mapper: (constraints) => constraints.cacheOrigin.round(),
  ),
  SliverSectionData(
    title: 'remainingCacheExtent',
    description:
        "Describes how much content the sliver should provide starting from the "
        "**cacheOrigin**.",
    mapper: (constraints) => constraints.remainingCacheExtent.round(),
  ),
];

Map<String, WidgetBuilder> get pages {
  return {
    Routes.slivers_constraints: (_) => FutureBuilder<void>(
          future: constraints.loadLibrary(),
          builder: (_, snapshot) =>
              snapshot.connectionState != ConnectionState.done
                  ? const SizedBox()
                  // ignore: prefer_const_constructors
                  : constraints.SliversConstraintsPage(),
        ),
    ...singlePages<SliverConstraints>(
      sliverExamples,
      builder: (example) => FutureBuilder<void>(
        future: single.loadLibrary(),
        builder: (_, snapshot) =>
            snapshot.connectionState != ConnectionState.done
                ? const SizedBox()
                // ignore: prefer_const_constructors
                : single.SingleSliverConstraintsPage(example),
      ),
    )
  };
}

Map<String, WidgetBuilder> singlePages<T>(
  List<SliverSectionData<T>> examples, {
  Widget Function(SliverSectionData<T> data)? builder,
}) {
  return Map.fromEntries(
    examples.map((example) {
      return MapEntry(
        '${Routes.slivers}/${example.title}',
        (_) => builder!(example),
      );
    }),
  );
}
