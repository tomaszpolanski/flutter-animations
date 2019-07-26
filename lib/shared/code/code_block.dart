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
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        code,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
