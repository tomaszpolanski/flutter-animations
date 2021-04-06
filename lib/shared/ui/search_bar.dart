import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(() {
        widget.onChanged(_controller!.text);
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextField(
        controller: _controller,
        style: Theme.of(context).primaryTextTheme.headline6,
        cursorColor: Theme.of(context).primaryTextTheme.headline6!.color,
        keyboardType: TextInputType.text,
        autofocus: true,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: _controller!.clear,
        )
      ],
    );
  }
}
