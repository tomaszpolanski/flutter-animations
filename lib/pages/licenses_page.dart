import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LicensesPage extends StatefulWidget {
  const LicensesPage({
    Key key,
    this.applicationName = AnimationCheatSheet.title,
    this.applicationVersion,
    this.applicationLegalese = '© Tomek Polański',
  }) : super(key: key);

  final String applicationName;
  final String applicationVersion;
  final String applicationLegalese;

  @override
  _LicensesPageState createState() => _LicensesPageState();
}

class _LicensesPageState extends State<LicensesPage> {
  @override
  void initState() {
    super.initState();
    _initLicenses();
  }

  final List<Widget> _licenses = <Widget>[];
  bool _loaded = false;

  Future<void> _initLicenses() async {
    await for (final license in LicenseRegistry.licenses) {
      if (!mounted) {
        return;
      }
      final List<LicenseParagraph> paragraphs =
          await SchedulerBinding.instance.scheduleTask<List<LicenseParagraph>>(
        license.paragraphs.toList,
        Priority.animation,
        debugLabel: 'License',
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _licenses.addAll(_loadLicenses(license, paragraphs));
      });
    }
    setState(() {
      _loaded = true;
    });
  }

  Iterable<Widget> _loadLicenses(
      LicenseEntry license, List<LicenseParagraph> paragraphs) sync* {
    yield const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Text('🍀‬', textAlign: TextAlign.center),
    );

    yield Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0),
        ),
      ),
      child: Text(
        license.packages.join(', '),
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
    for (final paragraph in paragraphs) {
      if (paragraph.indent == LicenseParagraph.centeredIndent) {
        yield Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            paragraph.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        assert(paragraph.indent >= 0);
        yield Padding(
          padding: EdgeInsetsDirectional.only(
            top: 8,
            start: 16.0 * paragraph.indent,
          ),
          child: Text(paragraph.text),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final String name = widget.applicationName;
    final String version = widget.applicationVersion;
    return Scaffold(
      body: Localizations.override(
        locale: const Locale('en', 'US'),
        context: context,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.caption,
          child: SafeArea(
            bottom: false,
            child: DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  if (version != null)
                    Text(
                      version,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  const SizedBox(height: 18),
                  Text(
                    widget.applicationLegalese ?? '',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Container(height: 18),
                  Text(
                    'Powered by Flutter',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(height: 24),
                  ..._licenses,
                  if (!_loaded)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
