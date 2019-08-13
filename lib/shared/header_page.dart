import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final AnimatedWidgetBuilder builder;

  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _headerController;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Align(
              child: Header(
                'Animations',
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                animation: _headerController,
              ),
            ),
            widget.builder(
              _controller,
              const Card(
                color: Colors.yellowAccent,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Icon(
                    Icons.star,
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
