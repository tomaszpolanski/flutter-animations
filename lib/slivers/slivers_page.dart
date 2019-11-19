import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/examples/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/slivers.dart' as slivers;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({Key key, @required this.repeatAnimations})
      : super(key: key);
  final bool repeatAnimations;

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      repeatAnimations: repeatAnimations,
      builder: (animation, child) {
        return Column(
          children: [
            const SectionHeader(
              title: Text('Slivers'),
              child: Text('Explenation how slivers work'),
            ),
            SliverSection(
              title: 'scrollOffset',
              body: const Text(slivers.scrollOffsetExample),
              builder: (context, onChanged) {
                return SliverConstraintsExample(
                  onChanged: (constraints) {
                    onChanged(constraints.scrollOffset.round().toString());
                  },
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                );
              },
            ),
            SliverSection(
              title: 'remainingPaintExtent',
              body: const Text(slivers.remainingPaintExtent),
              builder: (context, onChanged) {
                return SliverConstraintsExample(
                  onChanged: (constraints) {
                    onChanged(
                      constraints.remainingPaintExtent.round().toString(),
                    );
                  },
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class SliverSection extends StatefulWidget {
  const SliverSection({
    Key key,
    @required this.title,
    @required this.body,
    @required this.builder,
  })  : assert(title != null),
        assert(body != null),
        assert(builder != null),
        super(key: key);

  final String title;
  final Widget body;
  final Widget Function(BuildContext, ValueChanged<String> onChanged) builder;

  @override
  _SliverSectionState createState() => _SliverSectionState();
}

class _SliverSectionState extends State<SliverSection> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '$_value ${widget.title}',
      url: '$rawUrl/master/lib/slivers/examples/scroll_constraints.dart',
      released: DateTime(2000),
      body: widget.body,
      onPressed: () {},
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Placeholder(fallbackHeight: 500),
          ),
          widget.builder(context, (value) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() => _value = value);
            });
          }),
          const SliverToBoxAdapter(
            child: Placeholder(fallbackHeight: 500),
          ),
        ],
      ),
    );
  }
}
