import 'dart:io';

Future<void> main() async {
  if (isWebConfig()) {
    await File(yaml).rename(yamlWeb);
    await File(yamlDesktop).rename(yaml);
    await File(material).rename(materialWeb);
    await File(materialDesktop).rename(material);
  } else {
    await File(yaml).rename(yamlDesktop);
    await File(yamlWeb).rename(yaml);
    await File(material).rename(materialDesktop);
    await File(materialWeb).rename(material);
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
