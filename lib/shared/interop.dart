import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<void> copyText(String text) async {
  if (kIsWeb) {
    // await window.navigator.clipboard.writeText(text);
  } else {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
