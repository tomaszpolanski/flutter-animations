# Flutter Animations Cheat Sheet
[![Codemagic build status](https://api.codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/status_badge.svg)](https://codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/latest_build)

*WIP*

List of animations and transitions that you can used in Flutter.

Available as a [webpage](https://flutter-animations-cheat-sheet.codemagic.app/#/).

## Building on Desktop
* Last tested version of Flutter that works with this repo is `v1.7.8+hotfix.3`:
  * **Important**: Use `version` otherwise desktop won't be picked up: `flutter version v1.7.8+hotfix.3`

## Building and running Desktop application
* First enable desktop imports (detaults are web) buy running `./toggle.sh` script
### Linux
- Add the following to `.bash_profile` but replace `$HOME/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
export ENABLE_FLUTTER_DESKTOP=true
```
### Mac
- Add the following to `.bash_profile` but replace `$HOME/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
export ENABLE_FLUTTER_DESKTOP=true
```
- Update CocoaPods:
```
brew upgrade cocoapods
pod setup
gem install cocoapods
```
### Windows
- Add to PATH paths to dart and flutter and add `ENABLE_FLUTTER_DESKTOP` to env variables

* Check if `flutter devices` now shows your desktop device

## Running on Desktop
Enter `flutter-animations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-animations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app


## Testing
Testing on web can be run with `flutter pub run test -p chrome`
