import Foundation

/// The `WXKDarkSkyResponse` struct contains support for quick Swift-based decoding of responses from the Dark Sky API.
public struct WXKDarkSkyResponse : Decodable {
	public var latitude: Double
	public var longitude: Double
	public var timezone: String
	public var currently: WXKDarkSkyDataPoint?
	public var minutely: WXKDarkSkyDataBlock?
	public var hourly: WXKDarkSkyDataBlock?
	public var daily: WXKDarkSkyDataBlock?
	public var alerts: [WXKDarkSkyAlert]?
	public var flags: WXKDarkSkyFlags?
}

/// The `WXKDarkSkyDataPoint` struct encapsulates information about the weather at a given time from the Dark Sky API. All properties except `time` are optional.
public struct WXKDarkSkyDataPoint : Decodable {
	/// The UNIX time representing the beginning of the data point. For example, for current data points, this is the current time, and for daily data points, it's midnight. This property is required.
	public var time: Int
	/// The apparent temperature (heat index or wind chill) for the data point.
	public var apparentTemperature: Double?
	/// For daily data points, the maximum apparent temperature expected for the day.
	public var apparentTemperatureMax: Double?
	/// For daily data points, the UNIX time at which the apparent temperature will peak.
	public var apparentTemperatureMaxTime: Int?
	/// For daily data points, the minimum apparent temperature expected for the day.
	public var apparentTemperatureMin: Double?
	/// For daily data points, the UNIX time at which the apparent temperature will bottom out.
	public var apparentTemperatureMinTime: Int?
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
	public var precipIntensityMaxTime: Int?
	/// The probability of precipitation as a decimal number between 0 and 1, inclusive.
	public var precipProbability: Double?
	/// The precipitation type, if precipitation is occurring.
	public var precipType: String?
	/// The sea-level atmospheric pressure in millibars.
	public var pressure: Double?
	/// A human-readable summary of this data points.
	public var summary: String?
	/// For daily data points, the UNIX time at which sunrise will occur.
	public var sunriseTime: Int?
	/// For daily data points, the UNIX time at which sunset will occur.
	public var sunsetTime: Int?
	/// The temperature for the data point.
	public var temperature: Double?
    /// The daytime high temperature.
    public var temperatureHigh: Double?
    /// The UNIX time representing when the daytime high temperature occurs.
    public var temperatureHighTime: Int?
    /// The overnight low temperature.
    public var temperatureLow: Double?
    /// The UNIX time representing when the overnight low temperature occurs.
    public var temperatureLowTime: Int?
	/// The maximum temperature expected for the daily data point.
	public var temperatureMax: Double?
	/// The UNIX time for the maximum temperature for the daily data point.
	public var temperatureMaxTime: Int?
	/// The minimum temperature expected for the daily data point.
	public var temperatureMin: Double?
	/// The UNIX time for the minimum temperature for the daily data point.
	public var temperatureMinTime: Int?
	/// The UV index for the data point.
	public var uvIndex: Int?
	/// For daily data points, the UNIX time for the maximum expected UV index.
	public var uvIndexTime: Int?
	/// Visibility in miles, capped at 10 miles.
	public var visibility: Double?
	/// The wind bearing in degrees, indicating the direction the wind is coming **from**, with 0° being north and progressing clockwise.
	public var windBearing: Int?
	/// The wind gust in miles per hour.
	public var windGust: Double?
	/// For daily data points, the UNIX time for the maximum expected wind gust for the day.
	public var windGustTime: Int?
	/// The wind speed in miles per hour.
	public var windSpeed: Double?
}

/// The `WXKDarkSkyDataBlock` struct contains an array of data points for a period of time, such as hourly forecasts for the next 2 days or daily forecasts for the next week.
public struct WXKDarkSkyDataBlock : Decodable {
	/// An array of data points for the data block. This is required (but could be empty).
	public var data: [WXKDarkSkyDataPoint]
	/// A string summarizing the data block.
	public var summary: String?
	/// An icon name from Dark Sky summarizing the data block.
	public var icon: String?
}

/// The `WXKDarkSkyFlags` struct contains metadata about your forecast request.
public struct WXKDarkSkyFlags : Decodable {
	/// If this value is present, there was an issue getting data for the request.
	public var darkSkyUnavailable: Bool?
	/// An array of strings with identifiers for data sources used in fulfilling the request.
	///
	/// See [Dark Sky's API documentation](https://darksky.net/dev/docs/sources) for more details.
	public var sources: [String]
	/// The units supplied in the request.
	public var units: String
}

/// The `WXKDarkSkyAlert` struct contains information about a hypothetical alert in effect at the time of the forecast request.
public struct WXKDarkSkyAlert : Decodable {
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
