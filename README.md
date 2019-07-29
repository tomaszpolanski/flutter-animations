# Flutter Animations Cheat Sheet
[![Codemagic build status](https://api.codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/status_badge.svg)](https://codemagic.io/apps/5d360a1b3b905a001cfaa874/5d360a1b3b905a001cfaa873/latest_build)

*WIP*

List of animations and transitions that you can used in Flutter.

Available as a [webpage](https://flutter-animations-cheat-sheet.codemagic.app/#/).

# Building
By default the project is setup to be built for web. 
To toggle build configuration run `toggle.sh` on Linux/Mac and `toggle.bat` on Windows.

* Last tested version of Flutter that works with this repo is `v1.7.8+hotfix.3`:
  * **Important**: Use `version` otherwise desktop won't be picked up: `flutter version v1.7.8+hotfix.3`

## Building for Mobile
Run `toggle` script and proceed the same way as with a normal Flutter.

## Building for Web
1. To install the
    [`webdev` package](https://pub.dartlang.org/packages/webdev),
    which provides the build tools for Flutter for web, run the following:

    ```console
    $ flutter pub global activate webdev
    ```

    Ensure that the `$HOME/.pub-cache/bin` directory
    [is in your path](https://www.dartlang.org/tools/pub/cmd/pub-global#running-a-script-from-your-path),
    and then you may use the `webdev` command directly from your terminal.

    > Note: if you have problems configuring `webdev` to run directly, try:<br>
      `flutter pub global run webdev [command]`.
  
2. Update packages
    ```console
    $ flutter pub upgrade
    ```
3. Build and serve the example locally.
    ```console
    $ webdev serve
    [INFO] Generating build script completed, took 331ms
    ...
    [INFO] Building new asset graph completed, took 1.4s
    ...
    [INFO] Running build completed, took 27.9s
    ...
    [INFO] Succeeded after 28.1s with 618 outputs (3233 actions)
    Serving `web` on http://localhost:8080
    ```
    Open <http://localhost:8080> in Chrome

## Building for Desktop
* First enable desktop imports (defaults are web) buy running `./toggle.sh` script
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
