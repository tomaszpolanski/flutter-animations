import 'package:flutter/material.dart';

class Deferred extends StatelessWidget {
  const Deferred({
    Key? key,
    required this.future,
    required this.builder,
    this.fallback = const SizedBox(),
  }) : super(key: key);

  final Future<void> future;
  final WidgetBuilder builder;
  final Widget fallback;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: future,
      builder: (_, snapshot) => snapshot.connectionState != ConnectionState.done
          ? fallback
          : builder(context),
    );
  }
}
