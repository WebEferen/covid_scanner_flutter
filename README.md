# European Covid Certificate Scanner

This is a demo app which allows users to scan their certificate QR codes in order to add them into Apple Wallet (passkit) and Google Card.

## Getting Started

Normal Flutter application requires dart, xCode and Android SDK to be built.
To get started with flutter, please go to [Flutter.dev](https://flutter.dev/) and check how to get started.

### Installation

To install flutter dependencies, simply type:
```
flutter pub get
```

In order to analyze project You can type:
```
flutter analyze
```

### Run application

At first, copy ***.env.example*** into ***.env*** and update existing variables such as:
```dotenv
WALLET_SCHEME=https
WALLET_HOST=passkit-test.herokuapp.com
WALLET_PATH=/api/wallet
```
Those variables are for the testing model generation, so feel free to use it!


There are multiple ways to start the application, to start it as simple as possible, simply type:
```
flutter run
```

### Wallet

## License

Project is under MIT license, that means that it can be easily modified but it cannot be commercialised.

## Roadmap

### 1.0 Release

- [ ] Add support for Android Google Card
- [ ] onGenerateFailed, onGenerateSuccess screens
- [ ] Read from QR image (device read)

### 2.0 Release

- [ ] BLoC pattern
- [ ] Firebase connection implementation

## Changelog

Refer to the [Changelog](https://github.com/WebEferen/covid_scanner_flutter/blob/master/CHANGELOG.md) to get all release notes.

## Author

Currently application authors are:
- WebEferen [Michal Makowski](mailto://michal.makowski97@gmail.com)