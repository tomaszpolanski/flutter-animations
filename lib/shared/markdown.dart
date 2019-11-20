import 'package:flutter/material.dart';
import 'package:presentation/src/utils/split.dart';

class Markdown extends StatelessWidget {
  const Markdown(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    final lines = data.split('\r\n');
    return IgnorePointer(
      ignoring: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lines.length,
        itemBuilder: (context, index) => MarkdownLine(lines[index]),
      ),
    );
  }
}

class MarkdownLine extends StatelessWidget {
  const MarkdownLine(
    this.data, {
    Key key,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _createBold(data).toList(growable: false),
      ),
    );
  }
}

Iterable<InlineSpan> _createBold(String word) => splitMapJoin(
      word,
      RegExp(r'\*\*([a-zA-Z\.]+)\*\*'),
      onMatch: (m) {
        return TextSpan(
          text: m.group(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
      onNonMatch: _createItalic,
    );

Iterable<InlineSpan> _createItalic(String word) =>
    splitMapJoin(word, RegExp(r'\*([a-zA-Z\.]+)\*'),
        onMatch: (m) {
          return TextSpan(
            text: m.group(1),
            style: const TextStyle(fontStyle: FontStyle.italic),
          );
        },
        onNonMatch: (m) => [TextSpan(text: m)]);
