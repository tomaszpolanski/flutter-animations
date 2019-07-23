import 'package:animation_cheat_page/shared/material_import.dart';

class ScaleExample extends StatelessWidget {
  const ScaleExample({
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
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
