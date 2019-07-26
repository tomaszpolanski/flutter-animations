import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:http/http.dart' as http;

class CodeButton extends StatelessWidget {
  const CodeButton({
    Key key,
    @required this.url,
    @required this.onFetched,
  })  : assert(url != null),
        assert(onFetched != null),
        super(key: key);

  final String url;
  final ValueChanged<String> onFetched;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.code),
      tooltip: 'Show code',
      onPressed: () async {
        final code = await http.get(url);
        onFetched(
          code.body.replaceAll(
              "import 'package:animation_cheat_page/shared/material_import.dart';",
              ''),
        );
      },
    );
  }
}
