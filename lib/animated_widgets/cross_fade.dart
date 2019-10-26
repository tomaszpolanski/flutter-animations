import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CrossFadeExample extends StatefulWidget {
  const CrossFadeExample({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _CrossFadeExampleState createState() => _CrossFadeExampleState();
}

class _CrossFadeExampleState extends State<CrossFadeExample> {
  bool _showFirst = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // starts animating just after the first frame
    WidgetsBinding.instance.addPostFrameCallback(
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
    return AnimatedCrossFade(
      duration: const Duration(seconds: 4),
      firstChild: widget.child,
      secondChild: Card(
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Icon(
            Icons.public,
            size: 50,
          ),
        ),
      ),
      crossFadeState:
          _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
