import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/ui/footer.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/fill_remaining_sliver.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class FillOverscrollPage extends StatelessWidget {
  const FillOverscrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverExample example = widgetExamples[FillOverscrollPage];
    return MaterialApp(
      color: Colors.white,
      home: Theme(
        data: Theme.of(context).copyWith(platform: TargetPlatform.iOS),
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: DoubleSection(
                  title: example.title,
                  url: '',
                  released: DateTime(2000),
                  body: Markdown(
                    example.description,
                    style: GoogleFonts.crimsonPro(),
                  ),
                  children: const [
                    AppFrameCard(
                      title: 'fillOverscroll: false',
                      child: _OverscrollExample(fillOverscroll: false),
                    ),
                    AppFrameCard(
                      title: 'fillOverscroll: true',
                      child: _OverscrollExample(fillOverscroll: true),
                    ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OverscrollExample extends StatelessWidget {
  const _OverscrollExample({
    Key key,
    @required this.fillOverscroll,
  }) : super(key: key);

  final bool fillOverscroll;

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
          hasScrollBody: false,
          fillOverscroll: fillOverscroll,
          child: Container(
            color: Colors.yellowAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FlutterLogo(size: 50),
                Text(
                  'This is some longest text that should be centered'
                  'together with the logo',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
