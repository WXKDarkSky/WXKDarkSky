//
//  Date+unixTime.swift
//  WXKDarkSky
//
//  © 2018 Loop Weather Services LLC. Licensed under the MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

extension Date {
    internal var unixTime: Int {
        return Int(timeIntervalSince1970.rounded())
    }
}
