// ignore_for_file: prefer_single_quotes
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/slivers/geometry/slivers_geomerty_page.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:animation_cheat_page/slivers/single_page.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const description = '''
This page explains in an interactive way how 
different **SliverGeometry** describe Slivers.''';

final sliverExamples = <SliverSectionData<SliverGeometry>>[
  SliverSectionData(
    title: 'scrollExtent',
    description: "Total size of the sliver",
    mapper: (geometry) => geometry.scrollExtent.round(),
  ),
  SliverSectionData(
    title: 'paintOrigin',
    description:
        "The visual location of the first visible part of this sliver relative to "
        "its layout position.",
    mapper: (geometry) => geometry.paintOrigin.round(),
  ),
  SliverSectionData(
    title: 'paintExtent',
    description:
        "The visible size of the sliver. If only 50% of the sliver is visible "
        "then **paintExtent** is 50% of **Geometry.scrollExtent**",
    mapper: (geometry) => geometry.paintExtent.round(),
  ),
  SliverSectionData(
    title: 'layoutExtent',
    description:
        "The distance from the first visible part of this sliver to the first "
        "visible part of the next sliver, assuming the next sliver's "
        "**SliverConstraints.scrollOffset** is zero.",
    mapper: (geometry) => geometry.layoutExtent.round(),
  ),
  SliverSectionData(
    title: 'maxPaintExtent',
    description:
        "The (estimated) total paint extent that this sliver would be able to "
        "provide if the **SliverConstraints.remainingPaintExtent** was infinite.",
    mapper: (geometry) => geometry.maxPaintExtent.round(),
  ),
  SliverSectionData(
    title: 'maxScrollObstructionExtent',
    description:
        "The maximum extent by which this sliver can reduce the area in which "
        "content can scroll if the sliver were pinned at the edge.",
    mapper: (geometry) => geometry.maxScrollObstructionExtent.round(),
  ),
  SliverSectionData(
    title: 'hitTestExtent',
    description:
        "The distance from where this sliver started painting to the bottom of "
        "where it should accept touch events.",
    mapper: (geometry) => geometry.hitTestExtent.round(),
  ),
  SliverSectionData(
    title: 'visible',
    description: "Whether this sliver should be painted.",
    mapper: (geometry) => geometry.visible,
  ),
  SliverSectionData(
    title: 'hasVisualOverflow',
    description: "Whether this sliver has visual overflow.",
    mapper: (geometry) => geometry.hasVisualOverflow,
  ),
  SliverSectionData(
    title: 'scrollOffsetCorrection',
    description:
        "If this is non-zero after **RenderSliver.performLayout** returns, the scroll "
        "offset will be adjusted by the parent and then the entire layout of the "
        "parent will be rerun.",
    mapper: (geometry) => geometry.scrollOffsetCorrection?.round(),
  ),
  SliverSectionData(
    title: 'cacheExtent',
    description: "How many pixels the sliver has consumed in the "
        "**SliverConstraints.remainingCacheExtent**.",
    leading: const SliverToBoxAdapter(
      child: Placeholder(fallbackHeight: 1000),
    ),
    trailing: const SliverToBoxAdapter(
      child: Placeholder(fallbackHeight: 1000),
    ),
    mapper: (geometry) => geometry.cacheExtent.round(),
  ),
];

Map<String, WidgetBuilder> get pages {
  return {
    Routes.slivers_geometry: (_) => const SliversGeometryPage(),
    ...singlePages(
      sliverExamples,
      builder: (example) => SingleSliverGeometryPage(example as SliverSectionData<SliverGeometry>),
    ),
  };
}
