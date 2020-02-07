//
//  DarkSkyRequest+Point.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
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

        /**
         Creates a `Point` with the supplied latitude and longitude coordinates.
         
         - parameter latitude: The latitude coordinate as a `Double`.
         - parameter longitude: The longitude coordinate as a `Double`.
         */
        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }

        
        /**
         Creates a `Point` with the supplied latitude and longitude coordinates.
         
         - parameter latitude: The latitude coordinate as a `Double`.
         - parameter longitude: The longitude coordinate as a `Double`.
         */
        public init(_ latitude: Double, _ longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }

        public var description: String {
            return String(describing: latitude) + "," + String(describing: longitude)
        }
    }
}
