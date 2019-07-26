#!/bin/bash

set -e
dart ./lib/tools/toggle.dart
flutter packages get
