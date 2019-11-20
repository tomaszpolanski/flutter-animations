// ignore_for_file: prefer_single_quotes
import 'package:animation_cheat_page/shared/enum.dart';
import 'package:animation_cheat_page/slivers/examples/overlapping.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

const description = '''Explenation how slivers work''';

final sliverExamples = [
  SliverSectionData(
    title: 'scrollOffsetExample',
    description: "The scroll offset, in this sliver's coordinate "
        "system, that corresponds to the earliest visible part of this sliver in "
        "the [AxisDirection] if [growthDirection] is [GrowthDirection.forward] "
        "or in the opposite [AxisDirection] direction if [growthDirection] "
        "is [GrowthDirection.reverse].",
    mapper: (constraints) => constraints.scrollOffset.round(),
  ),
  SliverSectionData(
    title: 'remainingPaintExtent',
    description:
        "The number of pixels of content that the sliver should consider providing."
        "\n(Providing more pixels than this is inefficient.)\n"
        "The actual number of pixels provided should be specified in the"
        "[RenderSliver.geometry] as [SliverGeometry.paintExtent].",
    mapper: (constraints) => constraints.remainingPaintExtent.round(),
  ),
  SliverSectionData(
    title: 'userScrollDirection',
    description:
        "The scroll offset, in this sliver's coordinate system, that corresponds to "
        "the earliest visible part of this sliver in the [AxisDirection] if "
        "[growthDirection] is [GrowthDirection.forward] or in the opposite "
        "[AxisDirection] direction if [growthDirection] is [GrowthDirection.reverse].",
    mapper: (constraints) => fromEnum(constraints.userScrollDirection),
  ),
  SliverSectionData(
    title: 'precedingScrollExtent',
    description:
        "The scroll distance that has been consumed by all [Sliver]s that came "
        "before this [Sliver].",
    mapper: (constraints) => constraints.precedingScrollExtent.round(),
  ),
  SliverSectionData(
    title: 'overlap',
    description:
        "The number of pixels from where the pixels corresponding to the "
        "[scrollOffset] will be painted up to the first pixel that has not yet been "
        "painted on by an earlier sliver, in the [axisDirection].",
    leading: const SliverOverlappingExample(
      layoutPercentage: 0.8,
      child: Placeholder(fallbackHeight: 100),
    ),
    mapper: (constraints) => constraints.overlap.round(),
  ),
];

class SliverSectionData {
  const SliverSectionData({
    @required this.title,
    @required this.description,
    @required this.mapper,
    this.leading,
  });

  final String title;
  final String description;
  final Widget leading;
  final Object Function(SliverConstraints) mapper;
}
