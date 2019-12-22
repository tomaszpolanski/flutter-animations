import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_overscroll.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_remaining_page.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/has_scroll_body.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/sliver_fill_remaining.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get pages {
  return {
    Routes.sliver_fill_remaining: (_) => const SliverFillRemainingPage(),
    Routes.slivers_fill_remaining_example: (_) => const FillRemainingPage(),
    Routes.slivers_fill_remaining_fill_overscroll: (_) =>
        const FillOverscrollPage(),
    Routes.slivers_fill_remaining_has_scroll_body: (_) =>
        const HasScrollBodyPage(),
  };
}
