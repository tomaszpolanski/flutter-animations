import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:presentation/presentation.dart';

class ElevatedAppFrame extends StatelessWidget {
  const ElevatedAppFrame({
    Key key,
    @required this.title,
    @required this.elevation,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final String title;
  final Widget child;
  final Animation<double> elevation;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          fontFamily: 'Roboto',
        ),
        child: WrappedAnimatedBuilder(
          animation: elevation,
          builder: (context, animation, child) {
            return Card(
              clipBehavior: Clip.antiAlias,
              elevation: elevation.value,
              child: child,
            );
          },
          child: SizedBox(
            width: 300,
            height: 400,
            child: AppFrame(
              title: Text(
                title,
                style: const TextStyle(fontFamily: 'Roboto'),
                overflow: TextOverflow.fade,
              ),
              time: Text(DateFormat.Hm().format(DateTime.now())),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
