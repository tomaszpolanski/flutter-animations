import 'package:animation_cheat_page/pages/examples.dart' deferred as examples;
import 'package:animation_cheat_page/shared/deferred.dart';
import 'package:animation_cheat_page/shared/ui/footer.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  _AnimationProviderState createState() => _AnimationProviderState();
}

class _AnimationProviderState extends State<_AnimationProvider>
    with TickerProviderStateMixin {
  late AnimationController _headerController;

  @override
  void initState() {
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Deferred(
                  future: Future<void>.delayed(_headerController.isCompleted
                          ? Duration.zero
                          : _headerController.duration ?? Duration.zero)
                      .then(
                    (_) => Future.wait<void>([examples.loadLibrary()]),
                  ),
                  fallback: const SliverPadding(padding: EdgeInsets.zero),
                  builder: (context) => examples.Examples(
                    repeatAnimations: widget.repeatAnimations ?? false,
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
