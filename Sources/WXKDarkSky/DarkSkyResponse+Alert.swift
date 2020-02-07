//
//  DarkSkyResponse+Alert.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

@available(*, renamed: "DarkSkyResponse.Alert")
public typealias DarkSkyAlert = DarkSkyResponse.Alert

extension DarkSkyResponse {
    /// The `Alert` struct contains information about a hypothetical alert in effect at the time of the forecast request.
    public struct Alert: Codable {
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
}
