# WXKDarkSky
<p align="center">
    <a href="https://travis-ci.org/loopwxservices/WXKDarkSky"><img src="https://travis-ci.org/loopwxservices/WXKDarkSky.svg?branch=master"></a>
    <a href="https://github.com/loopwxservices/WXKDarkSky/blob/master/LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.0-brightgreen.svg" alt="Swift 5.0">
    </a>
</p>

This Swift package is a `Codable` layer over the Dark Sky API for quick and easy access to API response objects. It’s super straightforward and directly modeled after the [Dark Sky API docs](https://darksky.net/dev/docs/response). We use it in Loop Weather, and we thought others might find it helpful.

It also has some helpful basic networking functionality for requesting data from the Dark Sky API. It might not fully satisfy your networking needs, but it’s written in pure Swift, so you don’t need to worry about conflicting dependencies or anything like that. If the networking functionality in this package doesn’t cut it, you’re free to handle networking yourself and pass responses to the Codable class, `DarkSkyResponse`.

## Compatibility
WXKDarkSky should work great with Swift 5.

## Installation

### Swift Package Manager (recommended)
Of course, you'll need to add this package as a dependency in Swift Package Manager.

For Swift 4's Package Manager tools:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", from: "3.1.0")

Then, just be sure to add `"WXKDarkSky"` as a dependency in the `targets` section.

### CocoaPods
Adding WXKDarkSky via CocoaPods is super-simple. Just add this line to your Podfile:

```ruby
pod 'WXKDarkSky', '~> 3.1.0'
```

### Carthage
We do not currently provide official support for installation via Carthage. However, there is a decent chance that it works out of the box.

### Manual
Just get the source files out of the Sources folder and drag them into your Xcode project, and add them to any relevant targets. Just make sure to keep updated should changes be made to the Dark Sky API.

## Usage
The `DarkSkyResponse` object structure should perfectly match that of the [documented response format](https://darksky.net/dev/docs/response) for ease of reference. In keeping with the documentation, **nearly everything is an optional value**, even if it is frequently included. **Absolutely no assumption is made about the availability of weather data!**

### With networking
***IMPORTANT!*** Do **NOT** make requests through WXKDarkSky's networking code if the code is run client-side. Doing so puts your API key at risk of being compromised. It's best to use your own networking code to obtain Dark Sky data from a custom server-side solution that simply re-serves Dark Sky output so that your API key cannot be exposed. (You can even use WXKDarkSky's networking code with server-side Swift frameworks like Vapor or Perfect if your project allows for it.)

WXKDarkSky includes basic networking functionality to load data from the Dark Sky API. You can make requests to the API by making use of the `DarkSkyRequest(key:).loadData` method. Here’s an example:

```swift
let request = DarkSkyRequest(key: "YOURKEYHERE")
let point = DarkSkyRequest.Point(latitude: 37.4, -96.8)

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
The `loadData` method supports two additional parameters for configuring your request. It takes an optional `time` parameter which defaults to nil, to which you may pass a `Date` object for a Time Machine request.

It also takes an optional `options` parameter which you can set with any of the following options:

* `exclude`: Data blocks to exclude from the request.
* `extendHourly`: Whether to extend the hourly forecast to 168 hours instead of 48 hours.
* `language`: Language to be used in the response.
* `units`: Units to be used in the response.

An `Options` object can be initialized with any combination of the above four. If you do not include one, it will use the default setting. You can also use `Options.defaults` to access the default options (for example, `Options.defaults.extendHourly`). Here’s an example:
    
```swift
let options = DarkSkyRequest.Options(exclude: [.minutely, .alerts], extendHourly: true, language: .german, units: .si)

DarkSkyRequest.loadData(point: point, options: options) { (response, error) in
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
if let response = DarkSkyResponse(data: data) {
    // Sample to get the current temperature
    if let currently = response.currently {
        if let temperature = currently.temperature {
            print("Current temperature: " + String(describing: temperature))
        }
    }
}
```

## Contributing
If the Dark Sky API changes and we haven’t gotten around to updating WXKDarkSky yet, feel free to open an issue or a pull request and we’ll handle it promptly.

If you have a question about using WXKDarkSky, please either [open an issue](https://github.com/loopwxservices/WXKDarkSky/issues/new) or email us at **help {at} loopweather {dot} services**. We’ll be happy to help!

## WXKDarkSky in use
If you’ve done something using WXKDarkSky, we’d love to see it! Just send us an email at **help {at} loopweather {dot} services** with the project name and a link (and anything else interesting that you'd like to include), and we'll list it below. If your project is top-secret and you'd rather not share, that’s fine, too. We have our own top-secret projects.

## Licensing/legal
This package is licensed under the MIT License, which allows you to do just about anything with this Swift package (within Dark Sky's rules, of course) except sue us for any malfunctions, as long as you give us credit. We hope someone finds it useful.

While we're at it with the legal stuff: We are not affiliated in any way with The Dark Sky Company, LLC. Also, "Dark Sky" is their trademark, not ours.
