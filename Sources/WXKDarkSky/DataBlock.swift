//
//  DataBlock.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSkyRequest {
    /// Data blocks provided by the Dark Sky API. Used to exclude certain data blocks in a networking request.
    public enum DataBlock: String, CustomStringConvertible {
        /// The current conditions pertaining to the request.
        case currently
        /// A minute-by-minute forecast for the next hour.
        case minutely
        /// An hourly forecast for the next 48 hours.
        case hourly
        /// A daily forecast for the next week.
        case daily
        /// Any active alerts pertaining to the request.
        case alerts
        /// Metadata pertaining to the data provided in response to the request.
        case flags

        public var description: String {
            return rawValue
        }
    }
}
