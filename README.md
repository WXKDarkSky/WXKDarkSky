# WXKDarkSky
This Swift package is a `Codable` layer over the Dark Sky API for quick and easy access to API response objects. It’s super straightforward and directly modeled after the [Dark Sky API docs](https://darksky.net/dev/docs/response).

This package is written in pure Swift, and it has no dependencies, so you don’t need to worry about conflicts or anything like that.

## Compatibility
WXKDarkSky should work great with Swift 5.1.

## Installation
Install WXKDarkSky via Swift Package Manager, or if you really don't want to, you can also import the source files manually. CocoaPods and Carthage are not officially supported. Use them at your own risk.

### Swift Package Manager (recommended)
Of course, you'll need to add this package as a dependency in Swift Package Manager:

    .package(url: "https://github.com/loopwxservices/WXKDarkSky.git", from: "4.0.0")

Then, just be sure to add `"WXKDarkSky"` as a dependency in the `targets` section.

### Manual
Just get the source files out of the Sources folder and drag them into your Xcode project, and add them to any relevant targets. Just make sure to keep updated should changes be made to the Dark Sky API.

## Usage
The `DarkSkyResponse` object structure should perfectly match that of the [documented response format](https://darksky.net/dev/docs/response) for ease of reference. In keeping with the documentation, **nearly everything is an optional value**, even if it is frequently included. **Absolutely no assumption is made about the availability of weather data!**

### Build URLs for networking
WXKDarkSky does not include its own networking code, but you can build a URL for a request like so:

```swift
// Set up the request with your API key.
let request = DarkSkyRequest(key: "YOUR_API_KEY_HERE")
// Specify the point to use in the request
let point = DarkSkyRequest.Point(43.02, -108.38)

// Build a URL to use for a request using the default options
if let url = request.buildURL(point: point) {
    // ...
}
```

Your API key should **never** be hard-coded into a public product like an app; this puts it at risk of being compromised and, should it become compromised, will leave you with no way to replace the API key in code that already shipped.

### Request configuration
The `buildURL` method supports two additional parameters for configuring your request. It takes an optional `time` parameter which defaults to nil, to which you may pass a `Date` object for a Time Machine request.

You can also create a `DarkSkyRequest.Options` object to specify the following options for the Dark Sky API:

* `exclude`: Data blocks to exclude from the request.
* `extendHourly`: Whether to extend the hourly forecast to 168 hours instead of 48 hours.
* `language`: Language to be used in the response.
* `units`: Units to be used in the response.

A `DarkSkyRequest.Options` object can be initialized with any combination of the above four. If you do not include one, it will use the default setting. You can also use `Options.defaults` to access the default options (for example, `Options.defaults.extendHourly`).

### Accessing data from a response
After you obtain data from the Dark Sky API, using WXKDarkSky is very simple:

```swift
let data = // the data you retrieved
if let response = DarkSkyResponse(data: data) {
    // Sample to get the current temperature from the decoded JSON
    if let temperature = response.currently.temperature {
        print("Current temperature: " + String(describing: temperature))
    }
} else {
    // Gracefully handle a decoding error...
}
```

## Contributing
WXKDarkSky is no longer being actively maintained.

## Licensing/legal
This package is licensed under the MIT License, which allows you to do just about anything with this project (within Dark Sky's rules, of course) except sue for any malfunctions, as long as you give credit.

While we're at it with the legal stuff: This project is not affiliated in any way with The Dark Sky Company, LLC.
