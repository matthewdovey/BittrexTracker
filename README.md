[![Build Status](https://app.bitrise.io/app/46856f20d6dfcc3a/status.svg?token=SpGStajcN4PUkVFN7zUSiQ&branch=master)](https://app.bitrise.io/app/46856f20d6dfcc3a) ![GitHub release](https://img.shields.io/github/release/matthewdovey/bittrextracker.svg?style=flat) ![GitHub release](https://img.shields.io/github/last-commit/matthewdovey/bittrextracker.svg?style=flat)
 
# BittrexTracker
A framework acting as a SWIFT wrapper around the Bittrex Exchange APIs allowing the retrieval of public, market and account data.

## Contents

- [Development Version](#Development-version)
- [Current Support](#current-support)
- [Requirements](#requirements)
- [Installation](#installation)
- [Built With](#built-with)
- [Usage](#usage)
- [Contributing](#contributing)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)

## Development Version

- 1.2.9

## Supported API

Bittrex Public APIs:
- [x] getMarkets
- [x] getCurrencies
- [x] getTicker
- [x] getMarketSummaries
- [x] getMarketSummary
- [ ] getOrderBook
- [x] getMarketHistory

Bittrex Market APIs:
- [ ] buyLimit
- [ ] sellLimit
- [ ] cancel
- [ ] getOpenOrders

Bittrex Account APIs:
- [ ] getBalances
- [ ] getBalance
- [ ] getDepositAddress
- [ ] withdraw
- [ ] getOrder
- [ ] getOrderHistory
- [ ] getWithdrawalHistory
- [ ] getDepositHistory

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

To integrate BittrexTracker into your Xcode project using Carthage, specify it in your Cartfile:

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

Call the desired API on the created manager object and access the data or error encapsulated in the result:

```swift
let bittrexManager = BittrexManager()

bittrexManager.getCurrencies { result in
  switch result {
  case .success(let data):
    print(data)
  case .failure(let error):
    print(error)
  }
}

bittrexManager.getMarkets { result in
  switch result {
  case .success(let data):
    print(data)
  case .failure(let error):
    print(error)
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
