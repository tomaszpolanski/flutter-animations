import 'package:flutter/widgets.dart';

class SizeExample extends StatelessWidget {
  const SizeExample({
    required this.animation,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.horizontal,
      sizeFactor: animation,
      child: child,
    );
  }
}
