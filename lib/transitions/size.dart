import 'package:animation_cheat_page/shared/material_import.dart';

class SizeExample extends StatelessWidget {
  const SizeExample({
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
    return SizeTransition(
      axis: Axis.horizontal,
      sizeFactor: animation,
      child: child, // TODO(tomek) center it properly
    );
  }
}
