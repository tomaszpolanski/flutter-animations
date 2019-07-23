import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/network/urls.dart';

class ScaleExample extends StatelessWidget {
  const ScaleExample({
    @required this.animation,
    @required this.child,
    Key key,
  })  : assert(animation != null),
        assert(child != null),
        super(key: key);

  static const title = 'ScaleTransition';
  static const body = _body;
  static const url = '$rootUrl/blob/web/lib/transitions/scale.dart';

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

const _body = '''
Scale transition changes the size of the widget.
''';
