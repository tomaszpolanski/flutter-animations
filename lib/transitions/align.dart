import 'package:flutter/widgets.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({
    required this.animation,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: animation.drive(Tween<AlignmentGeometry>(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: child,
    );
  }
}
