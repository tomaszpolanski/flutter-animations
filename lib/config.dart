import 'package:fast_flutter_driver/fast_flutter_driver.dart';
import 'package:meta/meta.dart';

class Configuration implements BaseConfiguration {
  const Configuration({
    @required this.resolution,
    this.platform,
    this.route,
    this.repeatAnimations = true,
  }) : assert(resolution != null);

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      resolution: Resolution.fromJson(json['resolution']),
      platform: platformFromString(json['platform']),
      route: json['route'],
      repeatAnimations: json['enableAnimations'],
    );
  }
  @override
  final TestPlatform platform;

  @override
  final Resolution resolution;
  final String route;
  final bool repeatAnimations;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'resolution': resolution,
        if (platform != null) 'platform': fromEnum(platform),
        'route': route,
        'enableAnimations': repeatAnimations,
      };
}

class Routes {
  static const root = '/';
  static const curves = '/curves';
  static const not_found = '/not-found';
  static const content = '/content';
  static const licenses = '/licenses';
  static const slivers = '/slivers';
  static const slivers_constraints = '$slivers/constraints';
  static const slivers_geometry = '$slivers/geometry';
  static const slivers_fill_remaining_example = '$slivers/fill-remaining';
  static const slivers_fill_remaining_fill_overscroll =
      '$slivers_fill_remaining_example/fillOverscroll';
  static const slivers_fill_remaining_has_scroll_body =
      '$slivers_fill_remaining_example/hasScrollBody';
}
