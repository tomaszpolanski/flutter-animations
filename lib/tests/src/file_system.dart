import 'dart:io';

String platformPath(String path) {
  return Platform.isWindows ? path.replaceAll('/', '\\') : path;
}

bool exists(String path) =>
    path != null && File(platformPath(path)).existsSync();

String get platformNativeFile {
  return platformPath('${Directory.current.path}/$_nativeFile');
}

String get _nativeFile {
  if (Platform.isWindows) {
    return 'windows/window_configuration.cpp';
  } else if (Platform.isLinux) {
    return 'linux/main.cc';
  } else if (Platform.isMacOS) {
    return 'macos/Runner/MainFlutterWindow.swift';
  }
  assert(false);
  return null;
}
