import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_overscroll.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/has_scroll_body.dart';
import 'package:flutter/widgets.dart';

final widgetExamples = <dynamic, SliverExample>{
  SliverFillRemaining: const SliverExample(
    title: 'SliverFillRemaining',
    description: 'This Widget is irreplaceable when you want to '
        'center your content even if there is not enough space for it.',
    url: 'master/lib/slivers/fill_remaining/pages/sliver_fill_remaining.dart',
  ),
  FillOverscrollPage: const SliverExample(
    title: 'fillOverscroll',
    description: 'Demonstration how **fillOverscroll** works.',
    url: 'master/lib/slivers/fill_remaining/pages/fill_overscroll.dart',
  ),
  HasScrollBodyPage: const SliverExample(
    title: 'hasScrollBody',
    description: 'Demonstration how **hasScrollBody** works.\n'
        '**SliverFillRemaining** should not be larger than the available viewport. '
        'If the content is bigger you could either consider making it scrollable '
        'with **hasScrollBody** or just put that content in another scrollable sliver.',
    url: 'master/lib/slivers/fill_remaining/pages/has_scroll_body.dart',
  ),
};

class SliverExample {
  const SliverExample({
    @required this.title,
    @required this.description,
    @required String url,
  }) : _url = url;

  final String title;
  final String description;

  final String _url;

  String get fileUrl => '$rawUrl/$_url';
}
