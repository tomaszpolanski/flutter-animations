import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:intl/intl.dart';

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({
    Key key,
    @required this.title,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 300,
        height: 400,
        child: Stack(
          children: <Widget>[
            MediaQuery(
              data: const MediaQueryData(padding: EdgeInsets.only(top: 20)),
              child: Scaffold(
                appBar: AppBar(
                  primary: true,
                  title: Text(title),
                ),
                body: Center(child: child),
              ),
            ),
            Container(
              height: 28,
              color: Colors.black.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.signal_cellular_4_bar,
                    color: Colors.white,
                    size: 18,
                  ),
                  Icon(
                    Icons.battery_charging_full,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    DateFormat.Hm().format(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
