import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 11),
        child: Text(
          'new',
          style: Theme.of(context).textTheme.headline.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontFamily: 'Roboto',
                fontSize: 30,
              ),
        ),
      ),
    );
  }
}
