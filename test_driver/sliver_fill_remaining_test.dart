import 'dart:convert';

import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/tool.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'generic/test_configuration.dart';

void main(List<String> args) {
  group('Sliver Fill Remaining', () {
    late FlutterDriver driver;
    final properties = TestProperties(args);

    setUpAll(() async {
      driver = await FlutterDriver.connect(dartVmServiceUrl: properties.vmUrl);
    });

    tearDownAll(() async {
      await driver.close();
    });

    setUp(() async {
      await driver.requestData(
        json.encode(
          TestConfiguration(
            resolution: properties.resolution,
            configuration: const Configuration(
              route: Routes.slivers_fill_remaining_example,
              repeatAnimations: false,
            ),
          ),
        ),
      );
    });

    test('shows sliver', () async {
      await driver.waitFor(find.byType('FillRemainingPage'));
    });
  });
}
