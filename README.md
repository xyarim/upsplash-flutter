# Upsplash
![Flutter CI](https://github.com/xyarim/upsplash-flutter/workflows/Flutter%20CI/badge.svg)

Unofficial [Unsplash](https://unsplash.com/) client written using dart and flutter

## Sreenshots
<center>
<p float="left">
  <img src="https://user-images.githubusercontent.com/21035435/70373561-b5484080-190a-11ea-833b-e082e15a2e2b.png" width="252" height="504">
    <img src="https://user-images.githubusercontent.com/21035435/70373560-b1b4b980-190a-11ea-9af1-7f8a4f529afb.png" width="252" height="504">
  <img src="https://user-images.githubusercontent.com/21035435/70373562-b7aa9a80-190a-11ea-8dd4-fd282410930d.png" width="252" height="504">
</p>
</center>

## Architecture
<img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png" alt="Bloc Architecture" />

The goal of this pattern is to make it easy to separate presentation from business logic, facilitating testability and reusability.


## Libraries

### Architecture
* [flutter_bloc](https://bloclibrary.dev) A predictable state management library that helps implement the BLoC design pattern

### Networking
* [dio](https://github.com/flutterchina/dio) A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.

### Image utils
* [image_downloader](https://github.com/ko2ic/image_downloader) Flutter plugin that downloads images and movies on the Internet and saves to Photo Library on iOS or specified directory on Android.
* [transparent_image](https://github.com/brianegan/transparent_image) A transparent image in Dart code, represented as a Uint8List.

### Permissions
* [permission](https://github.com/once10301/permission) Flutter plugin for getting and requesting permission on Android.


### Reactive functional programming
* [RxDart](https://github.com/ReactiveX/rxdart) RxDart is a reactive functional programming library for Google Dart, based on ReactiveX.
