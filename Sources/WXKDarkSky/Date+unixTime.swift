//
//  Date+unixTime.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

extension Date {
    /**
     Returns the Unix time as an integer.
    */
    internal var unixTime: Int {
        return Int(timeIntervalSince1970.rounded())
    }
}
