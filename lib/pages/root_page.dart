import 'package:animation_cheat_page/animated_widgets/all_animated_widgets.dart'
    deferred as animated;
import 'package:animation_cheat_page/curves/curves.dart' deferred as curves;
import 'package:animation_cheat_page/shared/ui/description.dart';
import 'package:animation_cheat_page/shared/ui/footer.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/new_section.dart'
    deferred as new_section;
import 'package:animation_cheat_page/shared/ui/section.dart'
    deferred as section;
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart'
    deferred as transitions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' deferred as html;

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
    this.repeatAnimations = true,
  }) : super(key: key);

  final bool? repeatAnimations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AnimationProvider(repeatAnimations: repeatAnimations),
    );
  }
}

class _AnimationProvider extends StatefulWidget {
  const _AnimationProvider({
    Key? key,
    required this.repeatAnimations,
  }) : super(key: key);

  final bool? repeatAnimations;

  @override
  __AnimationProviderState createState() => __AnimationProviderState();
}

class __AnimationProviderState extends State<_AnimationProvider>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headerController;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    if (widget.repeatAnimations!) {
      _controller.repeat(reverse: true);
    }
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headerController.dispose();
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
    return Column(
      children: <Widget>[
        Expanded(
          child: Scrollbar(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Align(
                    child: Header(
                      'Animations',
                      animation: _headerController,
                    ),
                  ),
                ),
                FutureBuilder<void>(
                  future: Future.wait<void>([
                    animated.loadLibrary(),
                    curves.loadLibrary(),
                    new_section.loadLibrary(),
                    section.loadLibrary(),
                    transitions.loadLibrary(),
                  ]),
                  builder: (_, snapshot) => snapshot.connectionState !=
                          ConnectionState.done
                      ? const SliverFillRemaining(
                          child: Center(
                            child: SizedBox(child: CircularProgressIndicator()),
                          ),
                        )
                      : SliverList(
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
                              // ignore: prefer_const_constructors
                              section.SectionHeader(
                                title: const Text('Curves'),
                                child: const Text(curves.description),
                              ),
                              curves.CurvesSection(
                                animation: _controller,
                                onPressed: (url) => _handleUrl(context, url),
                                child: child,
                              ),
                              // ignore: prefer_const_constructors
                              section.SectionHeader(
                                title: const Text('Transitions'),
                                child: const Text(transitions.description),
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
                              // ignore: prefer_const_constructors
                              section.SectionHeader(
                                title: const Text('Animated Widgets'),
                                child: const Text(animated.description),
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
                        ),
                ),
              ],
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }
}
