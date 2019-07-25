import 'package:animation_cheat_page/shared/material_import.dart';

class DecoratedBoxExample extends StatelessWidget {
  const DecoratedBoxExample({
    @required this.animation,
    Key key,
  })  : assert(animation != null),
        super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: animation.drive(DecorationTween(
        begin: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(0)),
        ),
        end: BoxDecoration(
          color: Colors.yellowAccent,
          border: Border.all(color: Colors.black, width: 35),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
      )),
      child: const SizedBox(
        width: 140,
        height: 140,
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
  }
}
