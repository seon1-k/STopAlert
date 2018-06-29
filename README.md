STopAlert
============
[![CocoaPods](https://img.shields.io/cocoapods/v/STopAlert.svg)](https://github.com/Seonift/STopAlert)

STopAlert is a framework written in Swift that makes it show alert message at the top.

## Description

Let's print out the notification message in the status bar! This is a very neat way to nofity.

<img src="/stop.gif" width=400/>
<img src="/stopx.gif" width=400/>

## Usage

```swift
// Just message.
STopAlert.showMessage(text: "Hello World!")

// Alert with options.
STopAlert.showMessage(text: "Hello World!", backgroundColor: .blue, textColor: .darkGray, duration: 2.0, animationDuration: 0.25)
```

## Installation
#### Cocoapods
**STopAlert** is available through [CocoaPods](http://blog.cocoapods.org/Pod-Authors-Guide-to-CocoaPods-Frameworks/). To install it, simply add the following line to your `Podfile`:

```ruby
pod 'STopAlert'
```

## Contributions

Contributions are always welcome :).

This is my first swift framework. Please give me a lots of feedback!

## License
**STopAlert** is available under the MIT license. See the [LICENSE](https://github.com/Seonift/STopAlert/blob/master/LICENSE) file for more info.
