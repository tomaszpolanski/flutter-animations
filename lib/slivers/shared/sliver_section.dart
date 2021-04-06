import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:flutter/material.dart';

class SliverSection extends StatefulWidget {
  const SliverSection({
    Key? key,
    required this.title,
    required this.body,
    this.leading,
    this.trailing,
    required this.builder,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? leading;
  final Widget? trailing;
  final Widget Function(BuildContext, ValueChanged<Object?> onChanged) builder;

  @override
  _SliverSectionState createState() => _SliverSectionState();
}

class _SliverSectionState extends State<SliverSection> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '$_value ${widget.title}',
      url: '$rawUrl/master/lib/slivers/shared/scroll_constraints.dart',
      released: DateTime(2000),
      body: widget.body,
      onPressed: () {},
      child: CustomScrollView(
        slivers: [
          widget.leading ??
              const SliverToBoxAdapter(
                child: Placeholder(fallbackHeight: 500),
              ),
          widget.builder(context, (value) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              setState(() => _value = value.toString());
            });
          }),
          widget.trailing ??
              const SliverToBoxAdapter(
                child: Placeholder(fallbackHeight: 500),
              ),
        ],
      ),
    );
  }
}

class SliverSectionData<T> {
  const SliverSectionData({
    required this.title,
    required this.description,
    required this.mapper,
    this.leading,
    this.trailing,
  });

  final String title;
  final String description;
  final Widget? leading;
  final Widget? trailing;
  final Object? Function(T) mapper;
}
