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

This Swift package is a `Codable` layer over the Dark Sky API for quick and easy access to API response objects. It’s super straightforward and directly modeled after the [Dark Sky API docs](https://darksky.net/dev/docs/response). We use it in Loop Weather 2, and we thought others might find it helpful.

It also has some helpful basic networking functionality for requesting data from the Dark Sky API. It might not fully satisfy your networking needs, but it’s written in pure Swift, so you don’t need to worry about conflicting dependencies or anything like that. If the networking functionality in this package doesn’t cut it, you’re free to handle networking yourself and pass responses to the Codable class, `WXKDarkSkyResponse`.

## Installation
First, you’ll need to be using Swift 4. This code makes use of the `Codable` protocols, so the new version is a necessity.

***IMPORTANT!*** Do **NOT** make requests through WXKDarkSky's networking code if the code is run client-side. Doing so puts your API key at risk of being compromised. It's best to use your own networking code to obtain Dark Sky data from a custom server-side solution that simply re-serves Dark Sky output so that your API key cannot be exposed. (You can even use WXKDarkSky's networking code with server-side Swift frameworks like Vapor or Perfect if your project allows for it.)

### Swift Package Manager (recommended)
Of course, you'll need to add this package as a dependency in Swift Package Manager.

For Swift 4's Package Manager tools:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", from: "2.2.0")

Then, just be sure to add `"WXKDarkSky"` as a dependency in the `targets` section.

### CocoaPods
Adding WXKDarkSky via CocoaPods is super-simple. Just add this line to your Podfile:

```ruby
  pod 'WXKDarkSky', '~> 2.2.0'
```

### Carthage
We do not currently provide official support for installation via Carthage. However, there is a decent chance that it works out of the box. If interest warrants, we'll be happy to add official support.

### Manual
Just get the source files out of the Sources folder and drag them into your Xcode project, and add them to any relevant targets.

We don’t foresee massive changes to the Dark Sky API (or therefore this code) in the near future, so you shouldn’t have to come back here often for manual updates.

## Usage
### With networking
WXKDarkSky includes basic networking functionality to load data from the Dark Sky API. You can make requests to the API by making use of the `WXKDarkSkyRequest(key:).loadData` method. Here’s an example:

```swift
let request = WXKDarkSkyRequest(key: "YOURKEYHERE")
let point = Point(latitude: 37.4, -96.8)

request.loadData(point: point) { (data, error) in
    if let error = error {
        // Handle errors here...
    } else if let data = data {
        // Handle the received data here...
    }
}
```

Beyond this point, handling data is just as in the "Without networking" section.

#### Request configuration
The `loadData` method supports two parameters for configuring your request. It takes a `time` parameter, which defaults to nil, to which you may pass a `Date` object for a Time Machine request.

The method also takes an `options` parameter, which you can set with any of the following options:

* `exclude`: Data blocks to exclude from the request.
* `extendHourly`: Whether to extend the hourly forecast to 168 hours instead of 48 hours.
* `language`: Language to be used in the response.
* `units`: Units to be used in the response.

An `Options` object can be initialized with any combination of the above four. If you do not include one, it will use the default setting. Here’s an example:
    
```swift
let options = Options(exclude: [.minutely, .alerts], extendHourly: true, language: .german, units: .si)

WXKDarkSkyRequest.loadData(point: point, options: options) { (response, error) in
    if let response = response {
        // Successful request. Sample to get the current temperature...
        if let currently = response.currently {
            if let temperature = currently.temperature {
                print("Current temperature: " + String(describing: temperature))
            }
        }
    } else if let error = error {
        // Encountered an error, handle it here...
    }
}
```

As before, handle the results as in the "Without networking" section.

### Without networking
If you use other networking code, using WXKDarkSky is still very simple:

```swift
if let response = WXKDarkSkyResponse.converted(from data: data) {
    // Sample to get the current temperature
    if let currently = response.currently {
        if let temperature = currently.temperature {
            print("Current temperature: " + String(describing: temperature))
        }
    }
}


```

The `WXKDarkSkyResponse` object structure perfectly matches that of the [documented response format](https://darksky.net/dev/docs/response) for ease of reference. In keeping with the documentation, **nearly everything is an optional value**, even if it is frequently included. **Absolutely no assumption is made about the availability of weather data!**

## Contributing
If the Dark Sky API changes and we haven’t gotten around to updating WXKDarkSky yet, feel free to open an issue or a pull request and we’ll handle it promptly.

## License
This package is licensed under the MIT License, which allows you to do just about anything with this Swift package (within Dark Sky's rules, of course) but sue us for any malfunctions. We hope someone finds it useful.
