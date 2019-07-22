# Flutter Presentations

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

## Building on Desktop
* Last tested version of Flutter that works with this repo is `v1.7.8+hotfix.3`:
  * `flutter version v1.7.8+hotfix.3`

## Building and running Desktop application
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
Enter `flutter-presentations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-presentations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app

## Running on Docker
1) Install `docker`
2) Build docker image (will take a couple of minutes)
```
./build_docker.sh v1.7.8+hotfix.3 ./
```
3) Run docker container
```
docker run -d tomek/flutter:latest
```
4) Copy the container id that `docker run` returned
5) Execute Flutter tests with screenshots (in case you don't belie that actual application is being run ;))

```
docker exec <containerId> sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh -s"
```
6) Copy screenshots to local `screenshots` folder
```
docker cp <containerId> :/home/user/flutter-presentations/screenshots screenshots
```

(optional) Doing screenshots slow down Flutter driver tests, if you want to skip the screenshots just execute tests withou `-s`
```
docker exec <containerId> sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh"
```
