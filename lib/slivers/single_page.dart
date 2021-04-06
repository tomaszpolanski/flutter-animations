import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/shared/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class SingleSliverConstraintsPage extends StatelessWidget {
  const SingleSliverConstraintsPage(this.data, {Key? key}) : super(key: key);

  final SliverSectionData<SliverConstraints> data;

  @override
  Widget build(BuildContext context) {
    return _SingleSliverPage(
      data,
      title: const Text('Constraints'),
      builder: (context, ValueChanged<Object?> onChanged) {
        return SliverValueChanged(
          onConstraintsChanged: (constraints) {
            onChanged(data.mapper(constraints));
          },
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        );
      },
    );
  }
}

class SingleSliverGeometryPage extends StatelessWidget {
  const SingleSliverGeometryPage(this.data, {Key? key}) : super(key: key);

  final SliverSectionData<SliverGeometry> data;

  @override
  Widget build(BuildContext context) {
    return _SingleSliverPage(
      data,
      title: const Text('Geometry'),
      builder: (context, ValueChanged<Object?> onChanged) {
        return SliverValueChanged(
          onGeometryChanged: (geometry) {
            onChanged(data.mapper(geometry));
          },
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        );
      },
    );
  }
}

Map<String, WidgetBuilder> singlePages<T>(
  List<SliverSectionData<T>> examples, {
  Widget Function(SliverSectionData<T> data)? builder,
}) {
  return Map.fromEntries(
    examples.map((example) {
      return MapEntry(
        '${Routes.slivers}/${example.title}',
        (_) => builder!(example),
      );
    }),
  );
}

class _SingleSliverPage<T> extends StatelessWidget {
  const _SingleSliverPage(
    this.data, {
    Key? key,
    required this.title,
    required this.builder,
  }) : super(key: key);

  final SliverSectionData<T> data;
  final Widget title;
  final Widget Function(BuildContext, ValueChanged<Object?> onChanged) builder;

  @override
  Widget build(BuildContext context) {
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
              title: title,
              child: Markdown(
                'This example is **interactable**.\n'
                'You can scroll it to see how the value changes with '
                'different scroll position.',
                style: GoogleFonts.crimsonPro(),
              ),
            ),
            SliverSection(
              title: data.title,
              body: Markdown(
                data.description,
                style: GoogleFonts.crimsonPro(),
              ),
              leading: data.leading,
              trailing: data.trailing,
              builder: builder,
            ),
          ],
        );
      },
    );
  }
}
