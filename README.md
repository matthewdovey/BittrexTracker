[![Build Status](https://app.bitrise.io/app/46856f20d6dfcc3a/status.svg?token=SpGStajcN4PUkVFN7zUSiQ&branch=master)](https://app.bitrise.io/app/46856f20d6dfcc3a) ![GitHub release](https://img.shields.io/github/release/matthewdovey/bittrextracker.svg?style=flat) ![GitHub release](https://img.shields.io/github/last-commit/matthewdovey/bittrextracker.svg?style=flat)
 
# BittrexTracker
A framework acting as a SWIFT wrapper around the Bittrex Exchange APIs allowing the retrieval of public, market and account data.

## Contents

- [Version](#version)
- [Current Support](#current-support)
- [Future Support](#future-support)
- [Requirements](#requirements)
- [Installation](#installation)
- [Built With](#built-with)
- [Usage](#usage)
- [Contributing](#contributing)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)

## Version

- 1.2.3

## Supported API

Bittrex Public APIs:
```swift
- getMarkets
- getCurrencies
- getTicker
- getMarketSummaries
- getMarketSummary
- getOrderBook
- getMarketHistory
```

## Future Support

- Bittrex Market APIs (in progress)
- Bittrex Account APIs (in progress)

## Requirements

- iOS 10.0+
- Xcode 10.0+
- Swift 4.0+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SnapKit into your Xcode project using Carthage, specify it in your Cartfile:

```bash
github "matthewdovey/BittrexTracker"
```

Run carthage update to build the framework and drag the built BittrexTracker.framework into your Xcode project.

## Built With

- Bittrex Developer API v1.1 (https://bittrex.github.io/api/v1-1)

## Usage

Import the framework into the class you wish to use it in:

```swift
#import BittrexTracker
```

Call the desired API:

```swift
let publicAPI = PublicCollector()
publicAPI.getMarkets() { (response) in
    switch response.success{
        case True:
            print(response.data)
        case False:
            print(response.message)
    }
}

publicAPI.getCurrencies() { (response) in
    switch response.success{
        case True:
            print(response.data)
        case False:
            print(response.message)
    }
}
```

## Contributing

Feel free to contribute with pull requests and to create issues / feature requests following the [contributing file](CONTRIBUTING.md)

## Versioning

This version will be increased by 0.1.0 per release and 0.0.1 per pull request that goes into the project.

## Authors

* *Matthew Dovey* *https://github.com/matthewdovey*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
