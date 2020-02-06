//
//  DarkSkyRequest.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

/**
 The DarkSkyRequest class contains some networking utilities for working with the Dark Sky API.
 
 You initialize this class with your Dark Sky API key, like so:
 ```swift
 DarkSkyRequest(key: "YOUR KEY HERE").loadData(...)
 ```
 - warning: This class should **never** be used in client-side code. Doing so puts your API key at risk of being compromised, and should your API key be compromised, there is no way to reset your API key without breaking deployed client-side code with the old key. Instead, use a server-side solution to obtain data from the Dark Sky API.
*/
public final class DarkSkyRequest {
    /// Your Dark Sky API key.
    private var key: String

    /**
     Initializes the `DarkSkyRequest` object with the provided API key.
     
     - warning: This initializer should **never** be called in client-side code. Doing so puts your API key at risk of being compromised, and should your API key be compromised, there is no way to reset your API key without breaking deployed client-side code with the old key. Instead, use a server-side solution to obtain data from the Dark Sky API.
     
     - parameter key: The API key to use for requests originating from this instance.
     */
    public init(key: String) {
        self.key = key
    }

    /**
     Loads data from the Dark Sky API for a given point and set of options.
     
     - parameter point: The latitude-longitude point for the data request.
     - parameter time: The time for a Time Machine request; defaults to nil for current data.
     - parameter options: A set of options for fulfilling the request, such as units and language.
     - parameter completionHandler: A code block to handle the successful completion, or errors in completion, of the request.
    */
    @available(*, unavailable, message: "Networking functionality has been removed and will not return data. Please use your own networking code to obtain data")
    public func loadData(point: Point, time: Date? = nil, options: Options = Options.defaults, completionHandler: @escaping (DarkSkyResponse?, Error?) -> Void) {
        completionHandler(nil, DarkSkyError.removedNetworkingFunctionality)
    }

    /**
     Builds a URL for a Dark Sky API requests.
     
     - parameter key: The API key to use for the request.
     - parameter point: A latitude-longitude pair for the request.
     - parameter time: If present, the time for a Time Machine request before or after the current time.
     - parameter options: Options to use for the request.
     - returns: If a URL can be created, returns a `URL`. If not, returns nil.
    */
    public func buildURL(point: Point, time: Date? = nil, options: Options = Options.defaults) -> URL? {
        /// String describing the requested latitude-longitude pair.
        let coordinates = String(describing: point)

        // Build a URL to query.
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.darksky.net"
        if let time = time {
            // If this is a Time Machine request, modify the path to include a time.
            let unixTime = String(describing: time.unixTime)
            components.path = "/forecast/\(key)/\(coordinates),\(unixTime)"
        } else {
            // If no time was given, assume that we're getting the current data.
            components.path = "/forecast/\(key)/\(coordinates)"
        }

        switch options {
        case Options.defaults:
            break
        default:
            // If any of the options differ from the defaults, build a query string.
            components.queryItems = []

            // Now, from the options, build a query string.
            // If data blocks are to be excluded, exclude them.
            if options.exclude != Options.defaults.exclude {
                // We have to have a roundabout way of getting the exclusion list here.
                var excludeBlocks: [String] = []
                for block in options.exclude {
                    excludeBlocks.append(String(describing: block))
                }
                // Here, we probably have a string like '["currently", "alerts", "flags"]', which is not good for a URL.
                let excludeList = String(describing: excludeBlocks).replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                // After getting a string like "currently,alerts,flags" we can create a query item.
                let excludeQuery = URLQueryItem(name: "exclude", value: excludeList)
                components.queryItems?.append(excludeQuery)
            }

            // If the language is something other than the default, add a language query item.
            if options.language != Options.defaults.language {
                let languageQuery = URLQueryItem(name: "lang", value: String(describing: options.language))
                components.queryItems?.append(languageQuery)
            }

            // If the units are something other than the default, add a units query item.
            if options.units != Options.defaults.units {
                let unitsQuery = URLQueryItem(name: "units", value: String(describing: options.units))
                components.queryItems?.append(unitsQuery)
            }

            // If the "extend hourly" option differs from the default, add "extend=hourly".
            if options.extendHourly != Options.defaults.extendHourly {
                let extendQuery = URLQueryItem(name: "extend", value: "hourly")
                components.queryItems?.append(extendQuery)
            }
        }

        return components.url
    }
}
