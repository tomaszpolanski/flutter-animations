import 'dart:async';

import 'package:flutter/widgets.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
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
    return AnimatedOpacity(
      duration: const Duration(seconds: 4),
      opacity: _showFirst ? 1 : 0,
      child: widget.child,
    );
  }
}
