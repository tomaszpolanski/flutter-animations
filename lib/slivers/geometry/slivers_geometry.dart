// ignore_for_file: prefer_single_quotes
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:flutter/rendering.dart';

const description = '''This page explains in an interactive way how 
different **SliverGeometry** describe Slivers.''';

final sliverExamples = <SliverSectionData<SliverGeometry>>[
  SliverSectionData(
    title: 'scrollExtent',
    description:
        "The (estimated) total scrollable extent that this sliver has content for.",
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
        "The amount of currently visible visual space that was taken by the sliver "
        "to render the subset of the sliver that covers all or part of the "
        "[SliverConstraints.remainingPaintExtent] in the current viewport.",
    mapper: (geometry) => geometry.paintExtent.round(),
  ),
];
