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

This Swift package is a `Codable` layer over the Dark Sky API for quick and easy access to API response objects. It’s super straightforward and directly modeled after the [Dark Sky API docs](https://darksky.net/dev/docs/response). We use it in WeatherKit 2, and we thought others might find it helpful.

It also has some helpful basic networking functionality for requesting data from the Dark Sky API. It might not fully satisfy your networking needs, but it’s written in pure Swift, so you don’t need to worry about conflicting dependencies or anything like that. If the networking functionality in this package doesn’t cut it, you’re free to handle networking yourself and pass responses to the Codable class, `WXKDarkSkyResponse`.

## Installation
First, you’ll need to be using Swift 4. This code makes use of the `Codable` protocols, so the new version is a necessity.

### Swift Package Manager (recommended)
Of course, you'll need to add this package as a dependency in Swift Package Manager.

For Swift 4's Package Manager tools:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", from: "2.0.0")
    
If you’re courageous and you want to use the bleeding-edge version of WXKDarkSky, you can compile straight from the master branch (which should work fine as long as you see a “build passing” badge above) by using:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", .branch("master"))

Of course, it should be noted that if the master branch is broken for some reason, your project may well break, too. We try to keep the master branch builds passing, though, and it helps that the project doesn’t change rapidly.

Regardless of which path you choose, be sure to add `"WXKDarkSky"` as a dependency in the `targets` section.

### Manual
**It is ill-advised to make requests to the Dark Sky API from client-side code.** Doing so puts you at risk of compromising your API key.

Just get the source files out of the Sources folder and drag them into your Xcode project, and add them to any relevant targets.

We don’t foresee massive changes to the Dark Sky API (or therefore this code) in the near future, so you shouldn’t have to come back here often for manual updates.

### Carthage/CocoaPods
**It is ill-advised to make requests to the Dark Sky API from client-side code.** Doing so puts you at risk of compromising your API key.

Thus, given the client-side nature of Carthage and CocoaPods, we do not plan to support Carthage or CocoaPods for installation. You can certainly try them, but you’re on your own.

## Usage
### With networking
WXKDarkSky includes basic networking functionality to load data from the Dark Sky API. You can make requests to the API by making use of the `WXKDarkSkyRequest(key:).loadData` method. Here’s an example:

    let request = WXKDarkSkyRequest(key: "YOURKEYHERE")
    let point = Point(latitude: 37.4, -96.8)

    request.loadData(point: point) { (data, error) in
        if let error = error {
            // Handle errors here...
        } else if let data = data {
            // Handle the received data here...
        }
    }

#### Request configuration
The `loadData` method supports two parameters for configuring your request. It takes a `time` parameter, which defaults to nil, to which you may pass a `Date` object for a Time Machine request.

The method also takes an `options` parameter, which you can set with any of the following options:

* `exclude`: Data blocks to exclude from the request.
* `extendHourly`: Whether to extend the hourly forecast to 168 hours instead of 48 hours.
* `language`: Language to be used in the response.
* `units`: Units to be used in the response.

An `Options` object can be initialized with any combination of the above four. If you do not include one, it will use the default setting. Here’s an example:
    
    let options = Options(exclude: [.minutely, .alerts], extendHourly: true, language: .german, units: .si)

    WXKDarkSkyRequest.loadData(point: point, options: options) { (data, error) in
        // Handle the results here...
    }

### Without networking
If you choose to use other networking code, using WXKDarkSky becomes much like any JSON decoding in Swift 4:

    let decoder = JSONDecoder()
    let response = try! decoder.decode(WXKDarkSkyResponse.self, from: Data)
    
    // Sample to get the current temperature
    if let currently = response.currently {
        if let temperature = currently.temperature {
            print("Current temperature: "+temperature.description)
        }
    }
    
The `WXKDarkSkyResponse` object structure perfectly matches that of the [documented response format](https://darksky.net/dev/docs/response) for ease of reference. In keeping with the documentation, **nearly everything is an optional value**, even if it is frequently included. **Absolutely no assumption is made about the availability of weather data!**

## Contributing
If the Dark Sky API changes and we haven’t gotten around to updating WXKDarkSky yet, feel free to open an issue or a pull request and we’ll handle it promptly.

## License
This package is licensed under the MIT License, which allows you to do just about anything with this Swift package (within Dark Sky's rules, of course) but sue us for any malfunctions. We hope someone finds it useful.
