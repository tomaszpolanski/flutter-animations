import 'dart:io';

class Commands {
  Flutter get flutter => const Flutter._();
}

class Flutter {
  const Flutter._();

  String run(String target) {
    return 'flutter run -d $_device --target=$target -v';
  }

  String attach(String debugUri) {
    return 'flutter attach -d $_device --debug-uri $debugUri';
  }

  String dart(String file, [List<String> arguments]) {
    return 'dart $file ${arguments != null ? arguments.join(' ') : ''}';
  }

  String get _device {
    if (Platform.isWindows) {
      return 'windows';
    } else if (Platform.isLinux) {
      return 'linux';
    } else {
      return 'macos';
    }
  }
}
