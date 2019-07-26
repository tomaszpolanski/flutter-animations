import 'package:animation_cheat_page/shared/material_import.dart';

const bool isBrowser = identical(0, 0.0);

Future<void> copyText(String text) async {
  if (isBrowser) {
    await window.navigator.clipboard.writeText(text);
  } else {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
