import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedDefaultTextStyleExampleState createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool _showFirst = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // starts animating just after the first frame
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => setState(() => _showFirst = !_showFirst),
    );
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) => setState(() => _showFirst = !_showFirst),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(seconds: 4),
      style: _showFirst
          ? Theme.of(context).textTheme.headline4!
          : Theme.of(context).textTheme.headline2!,
      child: const Text('FlutterFlutterFlutterFlutterFlutterFlutter'),
    );
  }
}
