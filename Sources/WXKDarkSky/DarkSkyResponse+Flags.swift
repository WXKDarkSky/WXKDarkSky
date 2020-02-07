//
//  DarkSkyResponse+Flags.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

@available(*, renamed: "DarkSkyResponse.Flags")
public typealias DarkSkyFlags = DarkSkyResponse.Flags

extension DarkSkyResponse {
    /// The `Flags` struct contains metadata about your forecast request.
    public struct Flags: Codable {
        /// If this value is present, there was an issue getting data for the request.
        public var darkSkyUnavailable: Bool?
        /// An array of strings with identifiers for data sources used in fulfilling the request.
        ///
        /// See [Dark Sky's API documentation](https://darksky.net/dev/docs/sources) for more details.
        public var sources: [String]
        /// The units supplied in the request.
        public var units: String
    }
}
