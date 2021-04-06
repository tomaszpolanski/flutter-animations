import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DecoratedBoxExample extends StatelessWidget {
  const DecoratedBoxExample({
    required this.animation,
    Key? key,
  })  :
        super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: animation.drive(DecorationTween(
        begin: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(0)),
        ),
        end: BoxDecoration(
          color: Colors.yellowAccent,
          border: Border.all(width: 35),
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
