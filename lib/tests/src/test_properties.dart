import 'dart:math';

import 'package:args/args.dart';

const url = 'url';
const resolutionArg = 'resolution';

ArgParser testParser = ArgParser()
  ..addOption(
    url,
    abbr: url[0],
    help: 'Url for dartVmServiceUrl',
  )
  ..addOption(
    resolutionArg,
    abbr: resolutionArg[0],
    help: 'Resolution of device',
  );

class TestProperties {
  TestProperties(List<String> args) : _arguments = testParser.parse(args);

  final ArgResults _arguments;

  String get vmUrl => _arguments[url];

  Resolution get resolution => Resolution.fromSize(_arguments[resolutionArg]);
}

enum DeviceOrientation {
  portraitPhone,
  landscapePhone,
  portraitTablet,
  landscapeTablet,
}

const wideLayoutThreshold = 550;

class Resolution {
  const Resolution(this.width, this.height);

  factory Resolution.fromSize(String screenResolution) {
    final dimensions = screenResolution.split('x');
    return Resolution(double.parse(dimensions[0]), double.parse(dimensions[1]));
  }

  final double width;
  final double height;

  double get shortestSide => min(width.abs(), height.abs());

  bool get isTablet => shortestSide >= wideLayoutThreshold;

  DeviceOrientation get orientation {
    if (isTablet) {
      return width < height
          ? DeviceOrientation.portraitTablet
          : DeviceOrientation.landscapeTablet;
    } else {
      return width < height
          ? DeviceOrientation.portraitPhone
          : DeviceOrientation.landscapePhone;
    }
  }

  Map<String, dynamic> toJson() => {
        'width': width.floor(),
        'height': height.floor(),
      };
}
