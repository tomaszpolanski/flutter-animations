import 'dart:async';

import 'package:animation_cheat_page/shared/material_import.dart';

class PaddingExample extends StatefulWidget {
  const PaddingExample({
    Key key,
  }) : super(key: key);

  @override
  _PaddingExampleState createState() => _PaddingExampleState();
}

class _PaddingExampleState extends State<PaddingExample> {
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
    return Card(
      color: Colors.yellowAccent,
      child: AnimatedPadding(
        duration: const Duration(seconds: 4),
        padding:
            _showFirst ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
        child: const Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
  }
}
