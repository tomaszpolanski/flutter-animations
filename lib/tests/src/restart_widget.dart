//
//class RestartWidget<T> extends StatelessWidget {
//  const RestartWidget({
//    Key key,
//    @required this.stream,
//    @required this.builder,
//    @required this.initialData,
//  }) : super(key: key);
//
//  final T initialData;
//  final Stream<T> stream;
//  final Widget Function(BuildContext, T) builder;
//
//  Stream<T> _invalidate(T config) async* {
//    yield null;
//    await Future<dynamic>.delayed(const Duration(milliseconds: 16));
//    yield config;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<T>(
//      stream: stream,
//      initialData: initialData,
//      builder: (context, snapshot) {
//        return StreamBuilder(
//          initialData: snapshot.data,
//          stream: _invalidate(snapshot.data),
//          builder: (context, snapshot) {
//            return snapshot.data != null
//                ? builder(context, snapshot.data)
//                : const SizedBox();
//          },
//        );
//      },
//    );
//  }
//}
