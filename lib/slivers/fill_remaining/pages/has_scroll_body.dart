import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/fill_remaining_sliver.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/widgets.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HasScrollBodyPage extends StatelessWidget {
  const HasScrollBodyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Example example = widgetExamples[HasScrollBodyPage];
    return Scaffold(
      body: DoubleSection(
        title: example.title,
        url: example.fileUrl,
        released: example.released,
        body: example.body,
        children: [
          AppFrameCard(
            title: 'hasScrollBody: false',
            child: _HasScrollBodyExample(
              hasScrollBody: false,
              builder: (children) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
          AppFrameCard(
            title: 'hasScrollBody: true',
            child: _HasScrollBodyExample(
              hasScrollBody: true,
              builder: (children) => ListView(children: children),
            ),
          ),
        ],
      ),
    );
  }
}

class _HasScrollBodyExample extends StatelessWidget {
  const _HasScrollBodyExample({
    Key key,
    @required this.hasScrollBody,
    @required this.builder,
  }) : super(key: key);

  final bool hasScrollBody;
  final Widget Function(List<Widget> children) builder;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(const [
            ListTile(title: Text('First item')),
            ListTile(title: Text('Second item')),
            ListTile(title: Text('Third item')),
            ListTile(title: Text('Fourth item')),
          ]),
        ),
        CustomSliverFillRemaining(
          hasScrollBody: true,
          child: builder(
            [
              Container(
                color: Colors.yellowAccent,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('First item')),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('Second item')),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('Third item')),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('Fourth item')),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('Fifth item')),
              ),
              Container(
                color: Colors.yellowAccent,
                child: const ListTile(title: Text('Sixth item')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
