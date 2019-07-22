import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/material_import.dart';

class Section extends StatelessWidget {
  const Section({
    Key key,
    @required this.title,
    @required this.body,
    @required this.child,
  })  : assert(title != null),
        assert(body != null),
        assert(child != null),
        super(key: key);

  final String title;
  final Widget body;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.body1,
              child: body,
            ),
            const SizedBox(height: 20),
            PhoneFrame(
              title: title,
              child: child,
            ),
            Align(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var i = 0; i < 3; i++)
                    Container(
                      height: 8,
                      width: 8,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
