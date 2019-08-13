import 'package:animation_cheat_page/shared/animation_builder.dart';
import 'package:animation_cheat_page/shared/material_import.dart';

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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ),
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    final rowCount = screenWidth > 1080 ? 1 : screenWidth > 600 ? 2 : 5;
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
