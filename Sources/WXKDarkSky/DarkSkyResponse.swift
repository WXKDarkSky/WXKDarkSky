//
//  DarkSkyResponse.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
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
    public var currently: DataPoint?
    /// Minute-by-minute forecast for the next hour at the requested point.
    public var minutely: DataBlock?
    /// Hourly forecast for the next 48 hours at the requested point.
    public var hourly: DataBlock?
    /// Daily forecast for the next week at the requested point.
    public var daily: DataBlock?
    /// Any active alerts for the requested point.
    public var alerts: [Alert]?
    /// Metadata about the data returned for the requested point.
    public var flags: Flags?
    
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
