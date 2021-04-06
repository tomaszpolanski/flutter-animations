import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerExample extends StatefulWidget {
  const ContainerExample({
    Key? key,
  }) : super(key: key);

  @override
  _ContainerExampleState createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
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
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      padding: _showFirst ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
      decoration: _showFirst
          ? const BoxDecoration(color: Colors.yellowAccent)
          : BoxDecoration(
              color: Colors.blue,
              border: Border.all(width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
      child: const Icon(
        Icons.star,
        size: 50,
      ),
    );
  }
}
