# Flutter Animations Cheat Sheet
[![Codemagic build status](https://api.codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/status_badge.svg)](https://codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/latest_build)

This is a list of animations and transitions that you can used in Flutter.

Available as a [webpage](https://flutter-animations-cheat-sheet.codemagic.app/#/).
The content of the page is [searchable](https://flutter-animations-cheat-sheet.codemagic.app/#/content).

# Building
Last tested version of Flutter that works with this repo is `1.23.0-18.1.pre`:
  * **Important**: Use `version` otherwise desktop won't be picked up: `1.23.0-18.1.pre`

## Building for Web
Upgrade flutter to minimum `1.23.0-18.1.pre`, enable web compilation and run:
```
flutter version 1.23.0-18.1.pre
flutter config --enable-web
flutter run -d chrome -v
```

## Building for Desktop
### Linux
- Add the following to `.bash_profile` replacing `$HOME/flutter/` with path to your Flutter folder.
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
```
### Mac
- Add the following to `.bash_profile` replacing `$HOME/flutter/` with path to your Flutter folder.
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
```
- Update CocoaPods:
```
brew upgrade cocoapods
pod setup
gem install cocoapods
```
### Windows
- Install Visual Studio Community 2019 with [Desktop development with C++](https://devblogs.microsoft.com/cppblog/windows-desktop-development-with-c-in-visual-studio/#installation). 
Make sure that those components are installed:
* `MSVC v142 - VS 2019 C++ x64/x86 build tools (v14.23)`	
* `Windows 10 SDK (10.0.17763.0)` 

## Running on Desktop
Enter `flutter-animations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-animations` 
In IntelliJ/VS Code select appropriate device via device picker and run the app.

# Running Flutter Driver tests on Desktop
Installing [fast_flutter_driver](https://github.com/tomaszpolanski/fast_flutter_driver) script:
```shell script
pub global activate fast_flutter_driver_tool
flutter packages get
```
Running:
```
fastdriver -r 800x800
```
