//
//  DarkSkyResponse+DataPoint.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

@available(*, renamed: "DarkSkyResponse.DataPoint")
public typealias DarkSkyDataPoint = DarkSkyResponse.DataPoint

extension DarkSkyResponse {
    /// The `DataPoint` struct encapsulates information about the weather at a given time from the Dark Sky API. All properties except `time` are optional.
    public struct DataPoint: Codable {
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
}
