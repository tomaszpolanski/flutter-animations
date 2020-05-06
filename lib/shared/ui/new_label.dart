import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLabel extends StatelessWidget {
  const NewLabel({Key key}) : super(key: key);

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
          style: GoogleFonts.roboto(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
