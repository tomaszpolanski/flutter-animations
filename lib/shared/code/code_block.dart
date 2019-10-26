import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class CodeBlock extends StatelessWidget {
  const CodeBlock(
    this.code, {
    Key key,
  }) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Editor(
        code,
        brightness: Brightness.light,
        nested: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
