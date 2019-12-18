import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_overscroll.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_remaining_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get pages {
  return {
    Routes.slivers_fill_remaining_example: (_) => const FillRemainingPage(),
    Routes.slivers_fill_remaining_fill_overscroll: (_) =>
        const FillOverscrollPage(),
  };
}
