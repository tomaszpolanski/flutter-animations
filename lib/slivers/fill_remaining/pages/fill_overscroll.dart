import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/fill_remaining_sliver.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:animation_cheat_page/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FillOverscrollPage extends StatelessWidget {
  const FillOverscrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Example example = widgetExamples[SliverFillRemaining];
    return Material(
      child: DoubleSection(
        title: example.title,
        url: example.fileUrl,
        released: example.released,
        body: example.body,
        children: <Widget>[
          CustomScrollView(
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
                      FlutterLogo(size: 5),
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
          CustomScrollView(
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
                      FlutterLogo(size: 5),
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
        ],
      ),
    );
  }
}
