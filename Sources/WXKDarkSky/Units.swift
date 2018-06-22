//
//  Units.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSkyRequest {
    /// Sets of units supported by the Dark Sky API.
    public enum Units: String, CustomStringConvertible {
        /// Automatically determine units based on location.
        case auto
        /// Uses U.S. (imperial) units.
        case imperial = "us"
        /// Uses UK units, similar to SI except miles and mph are preferred.
        case unitedKingdom = "uk2"
        /// Uses Canadian units, similar to SI units except velocities are in km/h.
        case canadian = "ca"
        /// Uses SI units.
        case si

        public var description: String {
            return rawValue
        }
    }
}
