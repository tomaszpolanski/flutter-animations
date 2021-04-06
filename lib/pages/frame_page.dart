import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FramePage extends StatelessWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        primaryColor: Colors.green,
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Align: without Align')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Button',
                  style: GoogleFonts.roboto(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
