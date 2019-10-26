import 'package:animation_cheat_page/shared/code/code_block.dart';
import 'package:animation_cheat_page/shared/code/code_button.dart';
import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/interop.dart';
import 'package:animation_cheat_page/shared/ui/new_label.dart';
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({
    Key key,
    @required this.title,
    @required this.url,
    @required this.released,
    @required this.body,
    @required this.child,
    this.onPressed,
  })  : assert(title != null),
        assert(url != null),
        assert(released != null),
        assert(body != null),
        assert(child != null),
        super(key: key);

  final String title;
  final String url;
  final DateTime released;
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 640,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionTitle(
              title: widget.title,
              released: widget.released,
            ),
            const SizedBox(height: 20),
            DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 25),
              child: widget.body,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: widget.onPressed,
              child: MouseRegion(
                onEnter: (_) => _controller.forward(),
                onExit: (_) => _controller.reverse(),
                child: ElevatedAppFrame(
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
                        onPressed: () async {
                          await copyText(_code);
                          const snackBar = SnackBar(
                            content: Text('Code copied!'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                      ),
              ),
            ),
            if (_code != null) CodeBlock(_code),
            const Align(child: Separator())
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key key,
    @required this.title,
    @required this.child,
  })  : assert(title != null),
        assert(child != null),
        super(key: key);

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 640,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle.merge(
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              child: title,
            ),
            const SizedBox(height: 20),
            DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 25),
              child: child,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.released,
  })  : assert(title != null),
        assert(released != null),
        super(key: key);

  final String title;
  final DateTime released;

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style: Theme.of(context).textTheme.headline.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
    );
    return showNew(released)
        ? Wrap(
            spacing: 8,
            children: [
              NewLabel(),
              titleWidget,
            ],
          )
        : titleWidget;
  }
}

bool showNew(DateTime released) {
  // TODO(tomek) use cookies when they start working
  return DateTime.now().toUtc().difference(released).inDays < 5;
}
