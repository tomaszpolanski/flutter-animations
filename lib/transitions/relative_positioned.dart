import 'package:animation_cheat_page/shared/material_import.dart';

class RelativePositionedExample extends StatelessWidget {
  const RelativePositionedExample({
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
        RelativePositionedTransition(
          rect: animation.drive(RectTween(
            begin: const Rect.fromLTRB(0, 0, 0, 0),
            end: const Rect.fromLTRB(100, 100, 100, 100),
          )),
          size: const Size(100, 100),
          child: Align(child: child),
        ),
      ],
    );
  }
}
