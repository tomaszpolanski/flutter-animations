import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/shared/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class SingleSliverConstraintsPage extends StatelessWidget {
  const SingleSliverConstraintsPage(
    this.data, {
    Key key,
    @required this.repeatAnimations,
  }) : super(key: key);

  final SliverSectionData<SliverConstraints> data;
  final bool repeatAnimations;

  @override
  Widget build(BuildContext context) {
    final body = Container(
      height: 100,
      color: Colors.red,
    );
    return HeaderPage(
      repeatAnimations: repeatAnimations,
      header: AnimatedHeader(
        'Sliver',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      builder: (animation, child) {
        return Column(
          children: [
            const SectionHeader(
              title: SizedBox(),
              child: Markdown(
                'This example is **interactable**.\n'
                'You can scroll it to see how the value changes with '
                'different scroll position.',
                style: TextStyle(
                  fontFamily: 'CrimsonPro',
                ),
              ),
            ),
            SliverSection(
              title: data.title,
              body: Markdown(
                data.description,
                style: const TextStyle(
                  fontFamily: 'CrimsonPro',
                ),
              ),
              leading: data.leading,
              builder: (context, ValueChanged<Object> onChanged) {
                return SliverExample(
                  onConstraintsChanged: (constraints) {
                    onChanged(data.mapper(constraints));
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
