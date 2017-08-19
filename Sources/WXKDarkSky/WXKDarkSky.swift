import Foundation

/// The `WXKDarkSkyResponse` struct contains support for quick Swift-based decoding of responses from the Dark Sky API.
struct WXKDarkSkyResponse : Decodable {
	var latitude: Double
	var longitude: Double
	var timezone: String
	var currently: WXKDarkSkyDataPoint?
	var minutely: WXKDarkSkyDataBlock?
	var hourly: WXKDarkSkyDataBlock?
	var daily: WXKDarkSkyDataBlock?
	var alerts: [WXKDarkSkyAlert]?
	var flags: WXKDarkSkyFlags?
}

/// The `WXKDarkSkyDataPoint` struct encapsulates information about the weather at a given time from the Dark Sky API. All properties except `time` are optional.
struct WXKDarkSkyDataPoint : Decodable {
	/// The UNIX time representing the beginning of the data point. For example, for current data points, this is the current time, and for daily data points, it's midnight. This property is required.
	var time: Int
	/// The apparent temperature (heat index or wind chill) for the data point.
	var apparentTemperature: Double?
	/// For daily data points, the maximum apparent temperature expected for the day.
	var apparentTemperatureMax: Double?
	/// For daily data points, the UNIX time at which the apparent temperature will peak.
	var apparentTemperatureMaxTime: Int?
	/// For daily data points, the minimum apparent temperature expected for the day.
	var apparentTemperatureMin: Double?
	/// For daily data points, the UNIX time at which the apparent temperature will bottom out.
	var apparentTemperatureMinTime: Int?
	/// A decimal number between 0 and 1 (inclusive) indicating the percentage of sky covered by clouds.
	var cloudCover: Double?
	/// The dewpoint temperature in degrees Fahrenheit.
	var dewPoint: Double?
	/// The relative humidity as a decimal number between 0 and 1 (inclusive).
	var humidity: Double?
	/// A string with an icon name provided by Dark Sky representing the conditions for this data point.
	var icon: String?
	/// A decimal number representing the moon phase, where `0.0` is a new moon, `0.25` is first quarter, `0.5` is a full moon, and `0.75` is last quarter.
	var moonPhase: Double?
	/// The nearest storm's bearing in degrees, with `0` being north and progressing clockwise.
	var nearestStormBearing: Int?
	/// The nearest storm's distance in miles.
	var nearestStormDistance: Int?
	/// The columnar density of atmospheric ozone in Dobson units, a proxy for air quality.
	var ozone: Double?
	/// For hourly and daily data points, the amount of snowfall accumulation expected in inches.
	var precipAccumulation: Double?
	/// For all data points, this describes precipitation intensity as inches of **liquid water** per hour.
	var precipIntensity: Double?
	/// For daily data points, the maximum precipitation intensity expected for the day.
	var precipIntensityMax: Double?
	/// For daily data points, the UNIX time at which precipitation is expected to be heaviest.
	var precipIntensityMaxTime: Int?
	/// The probability of precipitation as a decimal number between 0 and 1, inclusive.
	var precipProbability: Double?
	/// The precipitation type, if precipitation is occurring.
	var precipType: String?
	/// The sea-level atmospheric pressure in millibars.
	var pressure: Double?
	/// A human-readable summary of this data points.
	var summary: String?
	/// For daily data points, the UNIX time at which sunrise will occur.
	var sunriseTime: Int?
	/// For daily data points, the UNIX time at which sunset will occur.
	var sunsetTime: Int?
	/// The temperature for the data point.
	var temperature: Double?
	/// The maximum temperature expected for the daily data point.
	var temperatureMax: Double?
	/// The UNIX time for the maximum temperature for the daily data point.
	var temperatureMaxTime: Int?
	/// The minimum temperature expected for the daily data point.
	var temperatureMin: Double?
	/// The UNIX time for the minimum temperature for the daily data point.
	var temperatureMinTime: Int?
	/// The UV index for the data point.
	var uvIndex: Int?
	/// For daily data points, the UNIX time for the maximum expected UV index.
	var uvIndexTime: Int?
	/// Visibility in miles, capped at 10 miles.
	var visibility: Double?
	/// The wind bearing in degrees, indicating the direction the wind is coming **from**, with 0° being north and progressing clockwise.
	var windBearing: Int?
	/// The wind gust in miles per hour.
	var windGust: Double?
	/// For daily data points, the UNIX time for the maximum expected wind gust for the day.
	var windGustTime: Int?
	/// The wind speed in miles per hour.
	var windSpeed: Double?
}

/// The `WXKDarkSkyDataBlock` struct contains an array of data points for a period of time, such as hourly forecasts for the next 2 days or daily forecasts for the next week.
internal struct WXKDarkSkyDataBlock : Decodable {
	/// An array of data points for the data block. This is required (but could be empty).
	var data: [WXKDarkSkyDataPoint]
	/// A string summarizing the data block.
	var summary: String?
	/// An icon name from Dark Sky summarizing the data block.
	var icon: String?
}

/// The `WXKDarkSkyFlags` struct contains metadata about your forecast request.
struct WXKDarkSkyFlags : Decodable {
	/// If this value is present, there was an issue getting data for the request.
	var darkSkyUnavailable: Bool?
	/// An array of strings with identifiers for data sources used in fulfilling the request.
	///
	/// See [Dark Sky's API documentation](https://darksky.net/dev/docs/sources) for more details.
	var sources: [String]
	/// The units supplied in the request.
	var units: String
}

/// The `WXKDarkSkyAlert` struct contains information about a hypothetical alert in effect at the time of the forecast request.
struct WXKDarkSkyAlert : Decodable {
	/// A detailed description of the alert, usually the product text.
	var description: String
	/// The expiration time as a UNIX time, which may possibly be undefined.
	var expires: Int?
	/// Regions covered by the alert.
	var regions: [String]
	/// The severity of the product.
	var severity: String
	/// The UNIX time at which the product was issued.
	var time: Int
	/// A title for the alert.
	var title: String
	/// A URI for detailed information about the product.
	var uri: String
}
