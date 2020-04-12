import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/ui/footer.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/fill_remaining_sliver.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class HasScrollBodyPage extends StatelessWidget {
  const HasScrollBodyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverExample example = widgetExamples[HasScrollBodyPage];
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: DoubleSection(
              title: example.title,
              url: example.fileUrl,
              released: DateTime(2000),
              body: Markdown(
                example.description,
                style: GoogleFonts.crimsonPro(),
              ),
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
          ),
          const Footer(),
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
          ]),
        ),
        CustomSliverFillRemaining(
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
