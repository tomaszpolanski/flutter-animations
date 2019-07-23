import 'package:animation_cheat_page/shared/animation_builder.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/section.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

const bool isBrowser = identical(0, 0.0);

class AnimationCheatSheet extends StatelessWidget {
  const AnimationCheatSheet({Key key}) : super(key: key);

  static final GlobalKey gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoOverflow(),
          child: child,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const _PresentationList(),
    );
  }
}

class NoOverflow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _AnimationProvider(),
    );
  }
}

class _AnimationProvider extends StatefulWidget {
  const _AnimationProvider({Key key}) : super(key: key);

  @override
  __AnimationProviderState createState() => __AnimationProviderState();
}

class __AnimationProviderState extends State<_AnimationProvider>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _headerController;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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

  void _handleUrl(BuildContext context, String url) {
    if (isBrowser) {
      window.open(url, 'Source Code');
    } else {
      Clipboard.setData(ClipboardData(text: url));
      final snackBar = SnackBar(
        content: Text('Copied link:\n$url'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    const child = Card(
      color: Colors.yellowAccent,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
    return Scrollbar(
      child: ListView(
        children: [
          Align(
            child: _Header(
              'Animations',
              animation: _headerController,
            ),
          ),
          for (final example in allTransitions)
            Section(
              title: example.title,
              body: Text(example.body),
              onPressed: () {
                _handleUrl(context, example.url);
              },
              child: example.builder(_controller, child),
            ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header(
    String text, {
    @required this.animation,
    Key key,
  })  : letters = text.split(''),
        super(key: key);

  final Animation<double> animation;
  final List<String> letters;

  @override
  Widget build(BuildContext context) {
    final children = [
      for (var i = 0; i < letters.length; i++)
        Container(
          height: 100,
          width: 80,
          color: Color.lerp(
            const Color(0xFF64B5F6),
            const Color(0xFF0C47A1),
            i / letters.length,
          ),
          child: Center(
            child: WrappedAnimatedBuilder<double>(
              animation: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    (i / 2) / letters.length,
                    (1 + i) / letters.length,
                    curve: Curves.ease,
                  ),
                ),
              ),
              builder: (context, animation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                    )),
                    child: child,
                  ),
                );
              },
              child: Text(
                letters[i],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
            ),
          ),
        ),
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: MediaQuery.of(context).size.width > 900
            ? Column(
                children: [
                  const FlutterLogo(size: 100),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: children,
                  )
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 300),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: children,
                  )
                ],
              ),
      ),
    );
  }
}
