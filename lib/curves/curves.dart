import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

const description = '''
TODO
''';

final c = Example(
  released: DateTime.utc(2019, 8, 3),
  title: 'SlideTransition',
  body: const Text("Slide transition moves widget X times of it's dimention."),
  url: 'master/lib/transitions/slide.dart',
  builder: (animation, child) => CurvesExample(
    animation: animation,
    child: child,
  ),
);

class CurvesSection extends StatefulWidget {
  const CurvesSection({
    Key key,
    @required this.animation,
    @required this.child,
    @required this.onPressed,
  })  : assert(animation != null),
        assert(child != null),
        assert(onPressed != null),
        super(key: key);

  final Widget child;
  final ValueChanged<String> onPressed;
  final Animation<double> animation;

  @override
  _CurvesSectionState createState() => _CurvesSectionState();
}

class _CurvesSectionState extends State<CurvesSection> {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: c.title,
      url: c.fileUrl,
      released: c.released,
      body: c.body,
      onPressed: () => widget.onPressed(c.pageUrl),
      child: c.builder(widget.animation, widget.child),
    );
  }
}

class CurvesExample extends StatefulWidget {
  const CurvesExample({
    @required this.animation,
    @required this.child,
    Key key,
  })  : assert(animation != null),
        assert(child != null),
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  _CurvesExampleState createState() => _CurvesExampleState();
}

class _CurvesExampleState extends State<CurvesExample> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SlideTransition(
            position: widget.animation
                .drive(CurveTween(curve: Curves.easeIn))
                .drive(Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, 1),
                )),
            child: widget.child,
          ),
          SlideTransition(
            position: widget.animation.drive(Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(0, 1),
            )),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
