import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/markdown.dart';
import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/examples/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/slivers.dart' as slivers;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({
    Key key,
    @required this.repeatAnimations,
  }) : super(key: key);
  final bool repeatAnimations;

  @override
  Widget build(BuildContext context) {
    final body = Container(
      height: 100,
      color: Colors.red,
    );
    return HeaderPage(
      repeatAnimations: repeatAnimations,
      header: AnimatedHeader(
        'Sliver',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      builder: (animation, child) {
        return Column(
          children: [
            const SectionHeader(
              title: Text('Constraints'),
              child: Markdown(slivers.description),
            ),
            for (final sliverData in slivers.sliverExamples)
              SliverSection(
                title: sliverData.title,
                body: Markdown(sliverData.description),
                leading: sliverData.leading,
                builder: (context, onChanged) {
                  return SliverConstraintsExample(
                    onChanged: (constraints) {
                      onChanged(sliverData.mapper(constraints));
                    },
                    child: body,
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
    this.leading,
    @required this.builder,
  })  : assert(title != null),
        assert(body != null),
        assert(builder != null),
        super(key: key);

  final String title;
  final Widget body;
  final Widget leading;
  final Widget Function(BuildContext, ValueChanged<Object> onChanged) builder;

  @override
  _SliverSectionState createState() => _SliverSectionState();
}

class _SliverSectionState extends State<SliverSection> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '$_value ${widget.title}',
      url: '$rawUrl/master/lib/slivers/slivers_page.dart',
      released: DateTime(2000),
      body: widget.body,
      onPressed: () {},
      child: CustomScrollView(
        slivers: [
          widget.leading ??
              const SliverToBoxAdapter(
                child: Placeholder(fallbackHeight: 500),
              ),
          widget.builder(context, (value) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() => _value = value.toString());
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
