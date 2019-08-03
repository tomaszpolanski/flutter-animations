import 'dart:async';

import 'package:animation_cheat_page/shared/material_import.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
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
    return AnimatedPhysicalModel(
      duration: const Duration(seconds: 4),
      color: _showFirst ? Colors.yellowAccent : Colors.greenAccent,
      elevation: _showFirst ? 0 : 7,
      shadowColor: Colors.black,
      shape: BoxShape.rectangle,
      borderRadius: _showFirst
          ? const BorderRadius.all(Radius.circular(0))
          : const BorderRadius.all(Radius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.all(40),
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
  }
}
