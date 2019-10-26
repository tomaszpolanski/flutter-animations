import 'dart:html';

import 'package:animation_cheat_page/shared/material_import.dart';

Future<void> copyText(String text) async {
  if (kIsWeb) {
    await window.navigator.clipboard.writeText(text);
  } else {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
