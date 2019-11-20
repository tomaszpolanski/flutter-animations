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

  Map<String, dynamic> toJson() => {
        'route': route,
        'enableAnimations': repeatAnimations,
      };
}

class Routes {
  static const root = '/';
  static const curves = '/curves';
  static const sliver_fill_remaining = '/sliver-fill-remaining';
  static const slivers_constraints = '/slivers/constraints';
}
