import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animation_cheat_page/animated_widgets/all_animated_widgets.dart'
    as animated;
import 'package:animation_cheat_page/curves/curves.dart' as curves;
import 'package:animation_cheat_page/shared/ui/description.dart';
import 'package:animation_cheat_page/shared/ui/new_section.dart' as new_section;
import 'package:animation_cheat_page/shared/ui/section.dart' as section;
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart'
    as transitions;
import 'package:flutter/services.dart';

import 'package:universal_html/html.dart' deferred as html;

class Examples extends StatefulWidget {
  const Examples({Key? key, required this.repeatAnimations}) : super(key: key);
  final bool repeatAnimations;

  @override
  _ExamplesState createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    if (widget.repeatAnimations) {
      _controller.repeat(reverse: true);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleUrl(BuildContext context, String url) async {
    if (kIsWeb) {
      await html.loadLibrary();
      html.window.open(url, 'Source Code');
    } else {
      await Clipboard.setData(ClipboardData(text: url));
      final snackBar = SnackBar(
        content: Text('Copied link:\n$url'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    const child = Card(
      color: Colors.yellowAccent,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const Align(child: Description()),
          const Align(child: Separator()),
          Align(
            child: new_section.NewSection(
              transitions: transitions.allTransitions,
              animated: animated.allAnimatedWidgets,
              curves: [curves.singleCurveExample],
            ),
          ),
          const section.SectionHeader(
            title: Text('Curves'),
            child: Text(curves.description),
          ),
          curves.CurvesSection(
            animation: _controller,
            onPressed: (url) => _handleUrl(context, url),
            child: child,
          ),
          const section.SectionHeader(
            title: Text('Transitions'),
            child: Text(transitions.description),
          ),
          for (final example in transitions.allTransitions)
            section.Section(
              title: example.title,
              url: example.fileUrl,
              released: example.released,
              body: example.body,
              onPressed: () {
                _handleUrl(context, example.pageUrl);
              },
              child: example.builder(_controller, child),
            ),
          const section.SectionHeader(
            title: Text('Animated Widgets'),
            child: Text(animated.description),
          ),
          for (final example in animated.allAnimatedWidgets)
            section.Section(
              title: example.title,
              url: example.fileUrl,
              released: example.released,
              body: example.body,
              onPressed: () {
                _handleUrl(context, example.pageUrl);
              },
              child: example.builder(_controller, child),
            ),
        ],
      ),
    );
  }
}
