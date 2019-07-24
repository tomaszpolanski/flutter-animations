import 'package:animation_cheat_page/shared/material_import.dart';

class PositionedExample extends StatelessWidget {
  const PositionedExample({
    @required this.animation,
    @required this.child,
    Key key,
  })  : assert(animation != null),
        assert(child != null),
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        PositionedTransition(
          rect: animation.drive(RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 50, 50),
            end: const RelativeRect.fromLTRB(50, 50, 100, 100),
          )),
          child: child,
        ),
      ],
    );
  }
}
