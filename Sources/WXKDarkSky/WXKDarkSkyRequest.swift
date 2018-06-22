import Foundation

/// The WXKDarkSkyRequest class contains some networking utilities for working with the Dark Sky API. You initialize this class with your Dark Sky API key, like so:
/// ```swift
/// WXKDarkSkyRequest(key: "YOUR KEY HERE").loadData(...)
/// ```
/// - warning: This class should **never** be used in client-side code. Doing so puts your API key at risk of being compromised, and should your API key be compromised, there is no way to reset your API key without breaking deployed client-side code with the old key. Instead, use a server-side solution to obtain data from the Dark Sky API.
public class WXKDarkSkyRequest {
    /// Your Dark Sky API key.
    var key: String

    public init(key: String) {
        self.key = key
    }

    /// Loads data from the Dark Sky API for a given point and set of options.
    /// - parameter point: The latitude-longitude point for the data request.
    /// - parameter time: The time for a Time Machine request; defaults to nil for current data.
    /// - parameter options: A set of options for fulfilling the request, such as units and language.
    /// - parameter completionHandler: A code block to handle the successful completion, or errors in completion, of the request.
    public func loadData(point: Point, time: Date? = nil, options: Options = Options.defaults, completionHandler: @escaping (WXKDarkSkyResponse?, Error?) -> Void) {
        // Set up a data task variable.
        var dataTask: URLSessionDataTask?

        // If there's an ongoing data task, cancel it.
        dataTask?.cancel()

        // Build a Dark Sky API URL.
        let url = buildDarkSkyURL(point: point, time: time, options: options)

        if let url = url {
            // Set up a URL load request.
            let session = URLSession(configuration: .default)
            dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
                if let error = error {
                    completionHandler(nil, error)
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    // Successfully retrieved data from the Dark Sky API.
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970

                    do {
                        // Attempt to decode the response into a WXKDarkSkyResponse object.
                        let decoded = try decoder.decode(WXKDarkSkyResponse.self, from: data)
                        completionHandler(decoded, nil)
                    } catch {
                        // Something was wrong with the response such that it could not be decoded.
                        completionHandler(nil, WXKDarkSkyError.malformedResponse)
                    }
                } else {
                    // ...something went wrong? Received data, but the status code was not 200 (OK).
                    completionHandler(nil, WXKDarkSkyError.couldNotRetrieveData)
                }
            })

            dataTask?.resume()
        } else {
            // Some error occurred in...generating the URL. The circumstances behind this are so unlikely that this will likely never be called, but it's helpful to open a door to handle it.
            completionHandler(nil, WXKDarkSkyError.unspecified)
        }
    }

    /// Builds a URL for a Dark Sky API requests.
    /// - parameter key: The API key to use for the request.
    /// - parameter point: A latitude-longitude pair for the request.
    /// - parameter time: If present, the time for a Time Machine request before or after the current time.
    /// - parameter options: Options to use for the request.
    /// - returns: If a URL can be created, returns a `URL`. If not, returns nil.
    public func buildDarkSkyURL(point: Point, time: Date? = nil, options: Options = Options.defaults) -> URL? {
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
