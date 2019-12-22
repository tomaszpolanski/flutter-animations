import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/fill_remaining_sliver.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class FillRemainingPage extends StatelessWidget {
  const FillRemainingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      repeatAnimations: false,
      builder: (_, __) => const _SliverFillRemainingContent(),
    );
  }
}

class _SliverFillRemainingContent extends StatelessWidget {
  const _SliverFillRemainingContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverExample example = widgetExamples[SliverFillRemaining];
    return Section(
      title: example.title,
      url: example.fileUrl,
      released: DateTime(2000),
      body: Markdown(
        example.description,
        style: GoogleFonts.crimsonPro(),
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [
              ListTile(title: Text('First item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
            ]),
          ),
          CustomSliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              color: Colors.yellowAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FlutterLogo(size: 200),
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
      ),
    );
  }
}
