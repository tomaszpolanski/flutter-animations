import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/constraints/slivers_constraints.dart'
    as slivers;
import 'package:animation_cheat_page/slivers/shared/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class SliversConstraintsPage extends StatelessWidget {
  const SliversConstraintsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Container(
      height: 100,
      color: Colors.red,
    );
    return HeaderPage(
      repeatAnimations: false,
      header: AnimatedHeader(
        'Sliver',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      builder: (animation, child) {
        return Column(
          children: [
            SectionHeader(
              title: const Text('Constraints'),
              child: Markdown(
                slivers.description,
                style: GoogleFonts.crimsonPro(),
              ),
            ),
            for (final sliverData in slivers.sliverExamples)
              SliverSection(
                title: sliverData.title,
                body: Markdown(
                  sliverData.description,
                  style: GoogleFonts.crimsonPro(),
                ),
                leading: sliverData.leading,
                trailing: sliverData.trailing,
                builder: (context, onChanged) {
                  return SliverValueChanged(
                    onConstraintsChanged: (constraints) {
                      onChanged(sliverData.mapper(constraints));
                    },
                    child: body,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
