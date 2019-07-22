import 'package:animation_cheat_page/shared/material_import.dart';

class SlideExample extends StatelessWidget {
  const SlideExample({
    @required this.animation,
    @required this.child,
    Key key,
  })  : assert(animation != null),
        assert(child != null),
        super(key: key);

  static const title = 'SlideTransition';
  static const body = _body;

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

const _body = '''
Slide transition moves widget X times of it's dimention.
''';
