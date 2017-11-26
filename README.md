# WXKDarkSky
<p align="center">
    <a href="https://travis-ci.org/loopwxservices/WXKDarkSky"><img src="https://travis-ci.org/loopwxservices/WXKDarkSky.svg?branch=master"></a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.0-brightgreen.svg" alt="Swift 4">
    </a>
</p>

This Swift package is a `Codable` layer over the Dark Sky API for quick and easy access to API response objects. It’s super straightforward and modeled after the [Dark Sky API docs](https://darksky.net/dev/docs/response). We use it in WeatherKit 2, and we thought others might find it helpful.

To be clear, this library *strictly* handles the coding of JSON data from Dark Sky into Swift structs. You’ll need to handle networking and all that on your own. (And of course, be sure to credit Dark Sky.)

## Getting started
First, you’ll need to be using Swift 4. This code makes use of the `Codable` protocols, so the new version is a necessity. This also assumes some level of familiarity with Swift Package Manager.

### Swift Package Manager
Of course, you'll need to add this package as a dependency in Swift Package Manager.

For Swift 4's Package Manager tools:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", from: "1.0.0")
    
If you’re courageous and you want to use the bleeding-edge version of `WXKDarkSky`, you can compile straight from the master branch (which should work fine as long as you see a “build passing” badge above) by using:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", .branch("master"))

Be sure to add `"WXKDarkSky"` as a dependency in the `targets` section, too.

### Carthage
Carthage is currently not officially supported as an installation medium. We’re not saying it’s impossible because it likely isn’t, but we don’t officially support it.

### CocoaPods
CocoaPods, like Carthage, is also not officially supported for installation at this time. If interest warrants, we’ll be happy to add support.

### Manual
Just get the "WXKDarkSky.swift" file out of the Sources folder and drag it into your Xcode project. We don’t foresee massive changes to the Dark Sky API (or therefore this code) in the near future, so you shouldn’t have to come back here often for manual updates.

## Usage
Usage of WXKDarkSky is much like any JSON decoding in Swift 4:

    let decoder = JSONDecoder()
    let response = try! decoder.decode(WXKDarkSkyResponse.self, from: Data)
    
    // Sample to get the current temperature
    if let currently = response.currently {
        if let temperature = currently.temperature {
            print("Current temperature: "+temperature.description)
        }
    }
    
The `WXKDarkSkyResponse` object structure perfectly matches that of the [documented response format](https://darksky.net/dev/docs/response) for ease of reference. In keeping with the documentation, **nearly everything is an optional value**, even if it is frequently included. No assumption is made about the availability of data.

If the API changes and we haven’t gotten around to updating WXKDarkSky yet, feel free to open an issue or a pull request and we’ll handle it promptly.

## License
This package is licensed under the MIT License, which allows you to do just about anything with this Swift package (within Dark Sky's rules, of course) but sue us for any malfunctions. We hope someone finds it useful.
