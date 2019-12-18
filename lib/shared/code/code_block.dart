import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock(
    this.code, {
    Key key,
  }) : super(key: key);

  final String code;

  @override
  _CodeBlockState createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _brightness = _brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Editor(
          widget.code,
          brightness: _brightness,
          nested: true,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}
