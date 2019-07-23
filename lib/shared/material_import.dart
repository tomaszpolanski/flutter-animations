//// For web
//export 'package:flutter_web/material.dart';
//export 'package:flutter_web_ui/ui.dart' show webOnlyInitializePlatform;
//export 'dart:html';

//For native
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

Future<void> webOnlyInitializePlatform() async {}

final Window window = Window();

class Window {
  void open(String url, String name) {}
}
