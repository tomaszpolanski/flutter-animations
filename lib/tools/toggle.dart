import 'dart:io';

Future<void> main() async {
  if (isWebConfig()) {
    await File(yaml).rename(yamlWeb);
    await File(yamlDesktop).rename(yaml);
    await File(material).rename(materialWeb);
    await File(materialDesktop).rename(material);
    await File(test).rename(testWeb);
    await File(testDesktop).rename(test);
  } else {
    await File(yaml).rename(yamlDesktop);
    await File(yamlWeb).rename(yaml);
    await File(material).rename(materialDesktop);
    await File(materialWeb).rename(material);
    await File(test).rename(testDesktop);
    await File(testWeb).rename(test);
  }
}

bool isWebConfig() => exists(yamlDesktop);

bool exists(String path) => path != null && File(path).existsSync();

const yamlDesktop = './pubspec_desktop.yaml';
const yamlWeb = './pubspec_web.yaml';
const yaml = './pubspec.yaml';

const materialDesktop = './lib/shared/material_desktop.txt';
const materialWeb = './lib/shared/material_web.txt';
const material = './lib/shared/material_import.dart';

const testDesktop = './test/dependencies_desktop.txt';
const testWeb = './test/dependencies_web.txt';
const test = './test/dependencies.dart';
