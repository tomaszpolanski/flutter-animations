import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:animation_cheat_page/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverFillRemainingPage extends StatelessWidget {
  const SliverFillRemainingPage({Key key}) : super(key: key);

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
    final Example example = widgetExamples[SliverFillRemaining];
    return Section(
      title: example.title,
      url: example.fileUrl,
      released: example.released,
      body: example.body,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [
              ListTile(title: Text('First item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
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
