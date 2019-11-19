import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/examples/scroll_offset.dart';
import 'package:animation_cheat_page/slivers/slivers.dart' as slivers;
import 'package:flutter/material.dart';
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
              child: Text(slivers.description),
            ),
            SliverSection(
              title: slivers.scrollOffsetExample.title,
              body: slivers.scrollOffsetExample.body,
              builder: (context, onChanged) {
                return SliverOffset(
                  onChanged: onChanged,
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
  final Widget Function(BuildContext, ValueChanged<String> onCanged) builder;

  @override
  _SliverSectionState createState() => _SliverSectionState();
}

class _SliverSectionState extends State<SliverSection> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '${widget.title} $_value',
      url: slivers.scrollOffsetExample.fileUrl,
      released: slivers.scrollOffsetExample.released,
      body: widget.body,
      onPressed: () {},
      child: CustomScrollView(
        slivers: <Widget>[
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
