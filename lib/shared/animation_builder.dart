import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WrappedAnimatedBuilder<T> extends StatelessWidget {
  const WrappedAnimatedBuilder({
    Key key,
    @required this.animation,
    @required this.builder,
    this.child,
  }) : super(key: key);

  final Animation<T> animation;
  final Widget Function(
    BuildContext context,
    Animation<T> animation,
    Widget child,
  ) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => builder(context, animation, child),
      child: child,
    );
  }
}
