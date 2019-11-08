import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:animation_cheat_page/tests/src/commands.dart';
import 'package:animation_cheat_page/tests/src/file_system.dart';
import 'package:args/args.dart';
import 'package:meta/meta.dart';
import 'package:process_run/shell.dart';
import 'package:rxdart/rxdart.dart';

const directory = 'directory';
const resolution = 'resolution';
const help = 'help';

Future<void> main(List<String> paths) async {
  stdout.writeln('Starting tests');
  exitCode = -1;
  final parser = createParser();
  final result = parser.parse(paths);
  if (result[help] == true) {
    print(parser.usage);
    return;
  }

  Directory('build').createSync(recursive: true);

  if (result[directory] != null) {
    await setUp(result, () async {
      for (final file in await _tests(result[directory])) {
        await test(
          testFile: file,
          resolution: result[resolution],
        );
      }
    });
  }

  stdout.writeln('Finishing tests');
  exitCode = 0;
}

Future<void> setUp(ArgResults args, Future<void> Function() test) async {
  final native = platformNativeFile;
  final nativeCopy = '$native\_copy';
  if (exists(native)) {
    await File(native).copy(nativeCopy);
  }

  final String screenResolution = args[resolution];
  if (screenResolution != null) {
    final dimensions = screenResolution.split('x');
    await _updateResolution(
      width: int.parse(dimensions[0]),
      height: int.parse(dimensions[1]),
    );
  }

  try {
    await test();
  } finally {
    if (exists(nativeCopy)) {
      await File(native).delete();
      await File(nativeCopy).rename(native);
    } else {
      stderr
          .writeln('Was not able to restore native as the copy does not exist');
      exitCode = 1;
    }
  }
}

Future<List<String>> _tests(String directoryPath) => Directory(directoryPath)
    .list(recursive: true)
    .where((file) => file.uri.path.endsWith('_test.dart'))
    .asyncMap((uri) => uri.path)
    .where(
      (path) => File(path.replaceFirst('_test.dart', '.dart')).existsSync(),
    )
    .toList();

ArgParser createParser() {
  return ArgParser()
    ..addOption(
      directory,
      abbr: directory[0],
      defaultsTo: 'test_driver',
      help: 'Run all the tests in the directory recursively',
    )
    ..addOption(
      resolution,
      abbr: resolution[0],
      help: 'Resolution of the application '
          'in format <width>x<height>, eg 800x600',
      defaultsTo: '400x700',
    )
    ..addFlag(
      help,
      abbr: help[0],
      help: 'Display this help message',
      negatable: false,
    );
}

const _main = 'build/main.dart';

Future<void> test({
  @required String testFile,
  @required String resolution,
}) async {
  assert(testFile != null);
  print('Testing $testFile');

  final completer = Completer<String>();

  final StreamController<List<int>> output = StreamController();
  final PublishSubject<String> input = PublishSubject();
  output.stream.transform(utf8.decoder).listen((data) async {
    final match = RegExp(r'is available at: (http://.*/)').firstMatch(data);
    if (match != null) {
      completer.complete(match.group(1));
    }
  });

  final mainFile = testFile.replaceFirst('_test.dart', '.dart');

  final testMainFile = await File(mainFile).copy(_main);

  // ignore: unawaited_futures
  Shell(
    stdout: output,
    stdin: input.map(utf8.encode),
  ).run(Commands().flutter.run(testMainFile.path)).then((_) {
    input.close();
    output.close();
  });

  final url = await completer.future;

  await Shell().run(
    Commands().flutter.dart(testFile, ['-u', url, '-r', resolution]),
  );

  input.add('q');
}

Future<void> _updateResolution({
  @required int width,
  @required int height,
}) async {
  final path = platformNativeFile;
  final read = await File(path).readAsString();
  final updatedNativeFile = _replaceResolution(
    read,
    width: width,
    height: height,
  );
  await File(path).writeAsString(updatedNativeFile);
}

String _replaceResolution(
  String nativeContent, {
  @required int width,
  @required int height,
}) {
  if (Platform.isWindows) {
    return nativeContent
        .replaceAllMapped(
          RegExp(r'kFlutterWindowWidth = (\d+);'),
          (m) => 'kFlutterWindowWidth = $width;',
        )
        .replaceAllMapped(
          RegExp(r'kFlutterWindowHeight = (\d+);'),
          (m) => 'kFlutterWindowHeight = $height;',
        );
  } else if (Platform.isLinux) {
    return nativeContent
        .replaceAllMapped(
          RegExp(r'window_properties.width = (\d+);'),
          (m) => 'window_properties.width = $width;',
        )
        .replaceAllMapped(
          RegExp(r'window_properties.height = (\d+);'),
          (m) => 'window_properties.height = $height;',
        );
  } else if (Platform.isMacOS) {
    return nativeContent.replaceAllMapped(
      RegExp(r'CGSize\(width: \d+, height: \d+\)'),
      (m) => 'CGSize(width: $width, height: $height)',
    );
  }
  assert(false);
  return null;
}
