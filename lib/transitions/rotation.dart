import 'package:animation_cheat_page/shared/material_import.dart';

class RotationExample extends StatelessWidget {
  const RotationExample({
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
    return RotationTransition(
      turns: animation,
      child: child,
    );
  }
}
