class Configuration {
  const Configuration({
    this.route,
    this.repeatAnimations = true,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      route: json['route'],
      repeatAnimations: json['enableAnimations'],
    );
  }

  final String route;
  final bool repeatAnimations;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'route': route,
        'enableAnimations': repeatAnimations,
      };
}

class Routes {
  static const root = '/';
  static const curves = '/curves';
  static const not_found = '/not-found';
  static const content = '/content';
  static const slivers = '/slivers';
  static const slivers_constraints = '$slivers/constraints';
  static const slivers_geometry = '$slivers/geometry';
  static const slivers_fill_remaining_example = '$slivers/fill-remaining';
  static const slivers_fill_remaining_fill_overscroll =
      '$slivers_fill_remaining_example/fillOverscroll';
  static const slivers_fill_remaining_has_scroll_body =
      '$slivers_fill_remaining_example/hasScrollBody';
}
