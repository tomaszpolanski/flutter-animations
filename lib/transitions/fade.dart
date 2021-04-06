import 'package:flutter/widgets.dart';

class FadeExample extends StatelessWidget {
  const FadeExample({
    required this.animation,
    required this.child,
    Key? key,
  })  :
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
