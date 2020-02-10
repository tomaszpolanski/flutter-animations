import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            begin: Theme.of(context).textTheme.headline4,
            end: Theme.of(context).textTheme.headline2,
          )),
      child: const Text('Flutter'),
    );
  }
}
