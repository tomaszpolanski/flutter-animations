import 'package:flutter/widgets.dart';

class SlideExample extends StatelessWidget {
  const SlideExample({
    required this.animation,
    required this.child,
    Key? key,
  })  :
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(Tween<Offset>(
        begin: const Offset(-0.5, 0),
        end: const Offset(0.5, 0),
      )),
      child: child,
    );
  }
}
