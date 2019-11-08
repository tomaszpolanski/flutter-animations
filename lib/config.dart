class Configuration {
  const Configuration({
    this.route = '404',
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      route: json['route'],
    );
  }

  final String route;

  Map<String, dynamic> toJson() => {
        'route': route,
      };
}

class Routes {
  static const root = '/';
  static const curves = '$root/curves';
  static const sliver_fill_remaining = '$root/sliver-fill-remaining';
}
