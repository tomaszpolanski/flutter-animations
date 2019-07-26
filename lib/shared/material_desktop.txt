export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

Future<void> webOnlyInitializePlatform() async {}

final Window window = Window();

class Window {
  void open(String url, String name) {}
  _Navigator get navigator => _Navigator();
}

class _Navigator {
  _Clipboard get clipboard => _Clipboard();
}

class _Clipboard {
  Future<void> writeText(String text) async {}
}
