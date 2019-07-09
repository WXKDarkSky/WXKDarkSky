//
//  Point.swift
//  WXKDarkSky
//
//  © 2019 Loop Weather Services LLC. Licensed under the MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

extension DarkSkyRequest {
    /// Encapsulates a latitude-longitude coordinate pair.
    public struct Point: CustomStringConvertible {
        /// A latitude coordinate.
        public var latitude: Double
        /// A longitude coordinate.
        public var longitude: Double

        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }

        public init(_ latitude: Double, _ longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }

        public var description: String {
            return String(describing: latitude) + "," + String(describing: longitude)
        }
    }
}
