import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PositionedExample extends StatefulWidget {
  const PositionedExample({
    Key key,
  }) : super(key: key);

  @override
  _PositionedExampleState createState() => _PositionedExampleState();
}

class _PositionedExampleState extends State<PositionedExample> {
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
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(seconds: 4),
          top: _showFirst ? 0 : 100,
          left: _showFirst ? 0 : 100,
          right: 0,
          child: const Card(
            color: Colors.yellowAccent,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Icon(
                Icons.star,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
