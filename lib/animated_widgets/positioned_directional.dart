import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PositionedDirectionalExample extends StatefulWidget {
  const PositionedDirectionalExample({
    Key key,
  }) : super(key: key);

  @override
  _PositionedDirectionalExampleState createState() =>
      _PositionedDirectionalExampleState();
}

class _PositionedDirectionalExampleState
    extends State<PositionedDirectionalExample> {
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          AnimatedPositionedDirectional(
            duration: const Duration(seconds: 4),
            top: _showFirst ? 0 : 100,
            start: _showFirst ? 0 : 100,
            end: 0,
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
      ),
    );
  }
}
