import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

const description = '''
TODO
''';

final c = Example(
  released: DateTime.utc(2019, 8, 3),
  title: 'Comparison',
  body: const Text('Compare how differenc curves behave'),
  url: 'master/lib/transitions/slide.dart',
  builder: (animation, child) => child,
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

const _allCurves = {
  Curves.linear: 'linear',
  Curves.decelerate: 'decelerate',
  Curves.fastLinearToSlowEaseIn: 'fastLinearToSlowEaseIn',
  Curves.ease: 'ease',
  Curves.easeIn: 'easeIn',
  Curves.easeInToLinear: 'easeInToLinear',
  Curves.easeInSine: 'easeInSine',
  Curves.easeInQuad: 'easeInQuad',
  Curves.easeInCubic: 'easeInCubic',
  Curves.easeInQuart: 'easeInQuart',
  Curves.easeInQuint: 'easeInQuint',
  Curves.easeInExpo: 'easeInExpo',
  Curves.easeInCirc: 'easeInCirc',
  Curves.easeInBack: 'easeInBack',
  Curves.easeOut: 'easeOut',
  Curves.linearToEaseOut: 'linearToEaseOut',
  Curves.easeOutSine: 'easeOutSine',
  Curves.easeOutQuad: 'easeOutQuad',
  Curves.easeOutCubic: 'easeOutCubic',
  Curves.easeOutQuart: 'easeOutQuart',
  Curves.easeOutQuint: 'easeOutQuint',
  Curves.easeOutExpo: 'easeOutExpo',
  Curves.easeOutCirc: 'easeOutCirc',
  Curves.easeOutBack: 'easeOutBack',
  Curves.easeInOut: 'easeInOut',
  Curves.easeInOutSine: 'easeInOutSine',
  Curves.easeInOutQuad: 'easeInOutQuad',
  Curves.easeInOutCubic: 'easeInOutCubic',
  Curves.easeInOutQuart: 'easeInOutQuart',
  Curves.easeInOutQuint: 'easeInOutQuint',
  Curves.easeInOutExpo: 'easeInOutExpo',
  Curves.easeInOutCirc: 'easeInOutCirc',
  Curves.easeInOutBack: 'easeInOutBack',
  Curves.fastOutSlowIn: 'fastOutSlowIn',
  Curves.slowMiddle: 'slowMiddle',
  Curves.bounceIn: 'bounceIn',
  Curves.bounceOut: 'bounceOut',
  Curves.bounceInOut: 'bounceInOut',
  Curves.elasticIn: 'elasticIn',
  Curves.elasticOut: 'elasticOut',
  Curves.elasticInOut: 'elasticInOut',
};

class _CurvesSectionState extends State<CurvesSection> {
  Curve _leftCurve = Curves.linear;
  Curve _rightCurve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: c.title,
      url: c.fileUrl,
      released: c.released,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          c.body,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DropdownButton(
                value: _leftCurve,
                onChanged: (curve) {
                  setState(() => _leftCurve = curve);
                },
                items: [
                  for (final curve in _allCurves.keys)
                    DropdownMenuItem<Curve>(
                      value: curve,
                      child: Text(_allCurves[curve]),
                    ),
                ],
              ),
              DropdownButton(
                value: _rightCurve,
                onChanged: (curve) {
                  setState(() => _rightCurve = curve);
                },
                items: [
                  for (final curve in _allCurves.keys)
                    DropdownMenuItem<Curve>(
                      value: curve,
                      child: Text(_allCurves[curve]),
                    ),
                ],
              ),
            ],
          )
        ],
      ),
      onPressed: () => widget.onPressed(c.pageUrl),
      child: CurvesExample(
        leftCurve: _leftCurve,
        rightCurve: _rightCurve,
        animation: widget.animation,
        child: widget.child,
      ),
    );
  }
}

class CurvesExample extends StatelessWidget {
  const CurvesExample({
    @required this.leftCurve,
    @required this.rightCurve,
    @required this.animation,
    @required this.child,
    Key key,
  })  : assert(leftCurve != null),
        assert(rightCurve != null),
        assert(animation != null),
        assert(child != null),
        super(key: key);

  final Curve leftCurve;
  final Curve rightCurve;
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SlideTransition(
            position: animation
                .drive(CurveTween(curve: leftCurve))
                .drive(Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, 1),
                )),
            child: child,
          ),
          SlideTransition(
            position: animation
                .drive(CurveTween(curve: rightCurve))
                .drive(Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, 1),
                )),
            child: child,
          ),
        ],
      ),
    );
  }
}
