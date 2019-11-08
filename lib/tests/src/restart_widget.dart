import 'package:animation_cheat_page/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestartWidget extends StatefulWidget {
  const RestartWidget({
    @required this.builder,
    Key key,
  }) : super(key: key);

  final Widget Function(BuildContext, Configuration) builder;

  static Future<void> restartApp(Configuration configuration) {
    final _RestartWidgetState state = _RestartWidgetState.global.currentContext
        .ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    return state.restartApp(configuration);
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  bool _restarting = false;
  Configuration _configuration = const Configuration();
  static final global = GlobalKey<_RestartWidgetState>();

  Future<void> restartApp(Configuration configuration) async {
    setState(() {
      _restarting = true;
      _configuration = configuration;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _restarting = false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: global,
      child: _restarting
          ? const SizedBox()
          : widget.builder(context, _configuration),
    );
  }
}
