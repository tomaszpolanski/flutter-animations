import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class AnimatedHeader extends StatefulWidget {
  const AnimatedHeader(
    this.text, {
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  _AnimatedHeaderState createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      widget.text,
      onPressed: widget.onPressed,
      animation: _controller,
    );
  }
}

class Header extends StatelessWidget {
  Header(
    String text, {
    @required this.animation,
    this.onPressed,
    Key key,
  })  : letters = text.split(''),
        super(key: key);

  final Animation<double> animation;
  final List<String> letters;
  final VoidCallback onPressed;

  int calculateRowCount(double screenWidth) {
    if (screenWidth > 1080) {
      return 1;
    } else if (screenWidth > 700) {
      return letters.length > 6 ? 2 : 1;
    }
    return (letters.length / 2).ceil();
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      for (var i = 0; i < letters.length; i++)
        Container(
          height: 140,
          width: 100,
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
                style: GoogleFonts.roboto(
                  fontSize: 44,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    final rowCount = calculateRowCount(screenWidth);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FlutterLogo(size: 140),
              ),
              for (int i = 0; i < rowCount; i++)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children.sublist(
                    i * (children.length / rowCount).round(),
                    (i + 1) * (children.length / rowCount).round(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
