//
//  DarkSkyResponse.swift
//  WXKDarkSky
//
//  © 2019 Loop Weather Services LLC. Licensed under the MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

/// The DarkSkyResponse struct contains support for encoding/decoding of JSON responses from the Dark Sky API.
public struct DarkSkyResponse: Codable {
    /// The requested point's latitude.
    public var latitude: Double
    /// The requested point's longitude.
    public var longitude: Double
    /// The requested point's timezone.
    public var timezone: String
    /// Current conditions for the requested point.
    public var currently: DarkSkyDataPoint?
    /// Minute-by-minute forecast for the next hour at the requested point.
    public var minutely: DarkSkyDataBlock?
    /// Hourly forecast for the next 48 hours at the requested point.
    public var hourly: DarkSkyDataBlock?
    /// Daily forecast for the next week at the requested point.
    public var daily: DarkSkyDataBlock?
    /// Any active alerts for the requested point.
    public var alerts: [DarkSkyAlert]?
    /// Metadata about the data returned for the requested point.
    public var flags: DarkSkyFlags?
    
    /**
     Creates a DarkSkyResponse struct from Dark Sky JSON data, if possible. This initializer is simply a wrapper around a `JSONDecoder`.
     
     This initializer will fail if the Dark Sky JSON provided to it cannot be decoded by a `JSONDecoder` into a `DarkSkyResponse` object for whatever reason, such as an incomplete download or other badly formatted JSON.
     
     - parameter data: Dark Sky JSON `Data` to be converted.
    */
    public init?(data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
            let response = try decoder.decode(DarkSkyResponse.self, from: data)
            self.latitude = response.latitude
            self.longitude = response.longitude
            self.timezone = response.timezone
            self.currently = response.currently
            self.minutely = response.minutely
            self.hourly = response.hourly
            self.daily = response.daily
            self.alerts = response.alerts
            self.flags = response.flags
        } catch {
            return nil
        }
    }
}

/// The `DarkSkyDataPoint` struct encapsulates information about the weather at a given time from the Dark Sky API. All properties except `time` are optional.
public struct DarkSkyDataPoint: Codable {
    /// The UNIX time representing the beginning of the data point. For example, for current data points, this is the current time, and for daily data points, it's midnight. This property is required.
    public var time: Date
    /// The apparent temperature (heat index or wind chill) for the data point.
    public var apparentTemperature: Double?
    /// For daily data points, the daytime high apparent temperature.
    public var apparentTemperatureHigh: Double?
    /// For daily data points, the UNIX time at which the daytime high apparent temperature occurs.
    public var apparentTemperatureHighTime: Date?
    /// For daily data points, the overnight low apparent temperature.
    public var apparentTemperatureLow: Double?
    /// For daily data points, the UNIX time at which the overnight low apparent temperature occurs.
    public var apparentTemperatureLowTime: Date?
    /// A decimal number between 0 and 1 (inclusive) indicating the percentage of sky covered by clouds.
    public var cloudCover: Double?
    /// The dewpoint temperature in degrees Fahrenheit.
    public var dewPoint: Double?
    /// The relative humidity as a decimal number between 0 and 1 (inclusive).
    public var humidity: Double?
    /// A string with an icon name provided by Dark Sky representing the conditions for this data point.
    public var icon: String?
    /// A decimal number representing the moon phase, where `0.0` is a new moon, `0.25` is first quarter, `0.5` is a full moon, and `0.75` is last quarter.
    public var moonPhase: Double?
    /// The nearest storm's bearing in degrees, with `0` being north and progressing clockwise.
    public var nearestStormBearing: Int?
    /// The nearest storm's distance in miles.
    public var nearestStormDistance: Int?
    /// The columnar density of atmospheric ozone in Dobson units, a proxy for air quality.
    public var ozone: Double?
    /// For hourly and daily data points, the amount of snowfall accumulation expected in inches.
    public var precipAccumulation: Double?
    /// For all data points, this describes precipitation intensity as inches of **liquid water** per hour.
    public var precipIntensity: Double?
    /// For daily data points, the maximum precipitation intensity expected for the day.
    public var precipIntensityMax: Double?
    /// For daily data points, the UNIX time at which precipitation is expected to be heaviest.
    public var precipIntensityMaxTime: Date?
    /// The probability of precipitation as a decimal number between 0 and 1, inclusive.
    public var precipProbability: Double?
    /// The precipitation type, if precipitation is occurring.
    public var precipType: String?
    /// The sea-level atmospheric pressure in millibars.
    public var pressure: Double?
    /// A human-readable summary of this data points.
    public var summary: String?
    /// For daily data points, the UNIX time at which sunrise will occur.
    public var sunriseTime: Date?
    /// For daily data points, the UNIX time at which sunset will occur.
    public var sunsetTime: Date?
    /// The temperature for the data point.
    public var temperature: Double?
    /// For daily data points, the daytime high temperature.
    public var temperatureHigh: Double?
    /// For daily data points, the UNIX time representing when the daytime high temperature occurs.
    public var temperatureHighTime: Date?
    /// For daily data points, the overnight low temperature.
    public var temperatureLow: Double?
    /// For daily data points, the UNIX time representing when the overnight low temperature occurs.
    public var temperatureLowTime: Date?
    /// The UV index for the data point.
    public var uvIndex: Int?
    /// For daily data points, the UNIX time for the maximum expected UV index.
    public var uvIndexTime: Date?
    /// Visibility in miles, capped at 10 miles.
    public var visibility: Double?
    /// The wind bearing in degrees, indicating the direction the wind is coming **from**, with 0° being north and progressing clockwise.
    public var windBearing: Int?
    /// The wind gust in miles per hour.
    public var windGust: Double?
    /// For daily data points, the UNIX time for the maximum expected wind gust for the day.
    public var windGustTime: Date?
    /// The wind speed in miles per hour.
    public var windSpeed: Double?
}

/// The `DarkSkyDataBlock` struct contains an array of data points for a period of time, such as hourly forecasts for the next 2 days or daily forecasts for the next week.
public struct DarkSkyDataBlock: Codable {
    /// An array of data points for the data block. This is required (but could be empty).
    public var data: [DarkSkyDataPoint]
    /// A string summarizing the data block.
    public var summary: String?
    /// An icon name from Dark Sky summarizing the data block.
    public var icon: String?
}

/// The `DarkSkyFlags` struct contains metadata about your forecast request.
public struct DarkSkyFlags: Codable {
    /// If this value is present, there was an issue getting data for the request.
    public var darkSkyUnavailable: Bool?
    /// An array of strings with identifiers for data sources used in fulfilling the request.
    ///
    /// See [Dark Sky's API documentation](https://darksky.net/dev/docs/sources) for more details.
    public var sources: [String]
    /// The units supplied in the request.
    public var units: String
}

/// The `DarkSkyAlert` struct contains information about a hypothetical alert in effect at the time of the forecast request.
public struct DarkSkyAlert: Codable {
    /// A detailed description of the alert, usually the product text.
    public var description: String
    /// The expiration time as a UNIX time, which may possibly be undefined.
    public var expires: Int?
    /// Regions covered by the alert.
    public var regions: [String]
    /// The severity of the product.
    public var severity: String
    /// The UNIX time at which the product was issued.
    public var time: Int
    /// A title for the alert.
    public var title: String
    /// A URI for detailed information about the product.
    public var uri: String
}
