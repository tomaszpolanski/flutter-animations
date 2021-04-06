import 'dart:async';

import 'package:flutter/widgets.dart';

class AlignExample extends StatefulWidget {
  const AlignExample({
    required this.child,
    Key? key,
  })  : super(key: key);

  final Widget child;

  @override
  _AlignExampleState createState() => _AlignExampleState();
}

class _AlignExampleState extends State<AlignExample> {
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
    return AnimatedAlign(
      duration: const Duration(seconds: 4),
      alignment: _showFirst ? Alignment.topLeft : Alignment.bottomRight,
      child: widget.child,
    );
  }
}
