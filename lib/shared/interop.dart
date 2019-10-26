import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

Future<void> copyText(String text) async {
  if (kIsWeb) {
    await html.window.navigator.clipboard.writeText(text);
  } else {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
