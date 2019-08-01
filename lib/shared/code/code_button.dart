import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:http/http.dart' as http;

class CodeButton extends StatefulWidget {
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
  _CodeButtonState createState() => _CodeButtonState();
}

class _CodeButtonState extends State<CodeButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      child: IconButton(
        icon: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              )
            : Icon(Icons.code),
        tooltip: 'Show code',
        onPressed: () async {
          setState(() => _isLoading = true);
          final code = await http.get(widget.url);
          setState(() => _isLoading = false);
          widget.onFetched(
            code.body
                .replaceAll(
                    "import 'package:animation_cheat_page/shared/material_import.dart';",
                    '')
                .trim(),
          );
        },
      ),
    );
  }
}
