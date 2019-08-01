import 'package:animation_cheat_page/shared/material_import.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        code,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
