import 'package:animation_cheat_page/shared/material_import.dart';

class DefaultTextStyleExample extends StatelessWidget {
  const DefaultTextStyleExample({
    @required this.animation,
    Key key,
  })  : assert(animation != null),
        super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyleTransition(
      style: animation
          .drive(CurveTween(curve: Curves.fastOutSlowIn))
          .drive(TextStyleTween(
            begin: Theme.of(context).textTheme.display1,
            end: Theme.of(context).textTheme.display3,
          )),
      child: const Text('Flutter'),
    );
  }
}
