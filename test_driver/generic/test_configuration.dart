import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/tool.dart';

class TestConfiguration implements BaseConfiguration {
  const TestConfiguration({
    required this.resolution,
    this.platform,
    required this.configuration,
  });

  factory TestConfiguration.fromJson(Map<String, dynamic> json) {
    return TestConfiguration(
      resolution: Resolution.fromJson(json['resolution']),
      platform: TestPlatformEx.fromString(json['platform']),
      configuration: Configuration.fromJson(json['configuration']),
    );
  }

  @override
  final TestPlatform? platform;
  @override
  final Resolution resolution;
  final Configuration configuration;

  @override
  Map<String, dynamic> toJson() {
    final p = platform;
    return <String, dynamic>{
      'resolution': resolution,
      if (p != null) 'platform': p.asString(),
      'configuration': configuration,
    };
  }
}
