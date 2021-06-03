import 'package:flutter/widgets.dart';

class RelativePositionedExample extends StatelessWidget {
  const RelativePositionedExample({
    required this.animation,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RelativePositionedTransition(
          rect: animation.drive(_RectTween(
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

class _RectTween extends Tween<Rect> {
  /// Creates a [Rect] tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as an empty rect at the top left corner.
  _RectTween({required Rect begin, required Rect end})
      : super(begin: begin, end: end);

  /// Returns the value this variable has at the given animation clock value.
  @override
  Rect lerp(double t) => Rect.lerp(begin, end, t)!;
}
