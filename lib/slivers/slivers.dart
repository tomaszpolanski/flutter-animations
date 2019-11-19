import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:flutter/widgets.dart';

const description = '''Explenation how slivers work''';

final scrollOffsetExample = SliverExample(
  released: DateTime.utc(2019, 8, 3),
  title: 'scrollOffset',
  body: const Text('scrollOffset'),
  url: 'master/lib/curves/curves.dart',
);

class SliverExample {
  const SliverExample({
    @required this.released,
    @required this.title,
    @required this.body,
    @required String url,
  })  : assert(released != null),
        assert(title != null),
        assert(url != null),
        assert(body != null),
        _url = url;

  final DateTime released;
  final String title;
  final Widget body;
  final String _url;

  String get pageUrl => '$rootUrl/$_url';

  String get fileUrl => '$rawUrl/$_url';
}
