//
//  Point.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSkyRequest {
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
