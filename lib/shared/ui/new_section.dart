import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:flutter/material.dart';

import 'new_label.dart';

class NewSection extends StatelessWidget {
  const NewSection({
    Key? key,
    required this.transitions,
    required this.animated,
    required this.curves,
  }) : super(key: key);

  final List<Example> transitions;
  final List<Example> animated;
  final List<Example> curves;

  @override
  Widget build(BuildContext context) {
    final children = [
      ...transitions.where((example) => showNew(example.released)),
      ...animated.where((example) => showNew(example.released)),
      ...curves.where((example) => showNew(example.released)),
    ]
        .map((example) => Text(
              '    • ${example.title}',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25),
            ))
        .toList(growable: false);
    return children.isNotEmpty
        ? Container(
            width: 640,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    const NewLabel(),
                    Text(
                      ' wigets:',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                ...children,
                const Align(child: Separator()),
              ],
            ),
          )
        : const SizedBox();
  }
}
