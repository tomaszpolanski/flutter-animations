import 'package:animation_cheat_page/shared/code/code_block.dart';
import 'package:animation_cheat_page/shared/code/code_button.dart';
import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/material_import.dart';

class Section extends StatefulWidget {
  const Section({
    Key key,
    @required this.title,
    @required this.url,
    @required this.body,
    @required this.child,
    this.onPressed,
  })  : assert(title != null),
        assert(url != null),
        assert(body != null),
        assert(child != null),
        super(key: key);

  final String title;
  final String url;
  final Widget body;
  final Widget child;
  final VoidCallback onPressed;

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String _code;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.body1,
              child: widget.body,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: widget.onPressed,
              child: Listener(
                onPointerEnter: (_) => _controller.forward(),
                onPointerExit: (_) => _controller.reverse(),
                child: PhoneFrame(
                  title: widget.title,
                  elevation: _controller.drive(
                    Tween<double>(begin: 1, end: 3),
                  ),
                  child: widget.child,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _code == null
                    ? CodeButton(
                        url: widget.url,
                        onFetched: (code) {
                          setState(() => _code = code);
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.content_copy),
                        tooltip: 'Copy code',
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: _code));
                          const snackBar = SnackBar(
                            content: const Text('Code copied!'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                      ),
              ),
            ),
            if (_code != null) CodeBlock(_code),
            Align(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var i = 0; i < 3; i++)
                    Container(
                      height: 8,
                      width: 8,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
