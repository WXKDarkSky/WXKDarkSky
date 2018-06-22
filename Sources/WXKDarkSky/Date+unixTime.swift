//
//  DateUtilities.swift
//  WXKDarkSky
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension Date {
    internal var unixTime: Int {
        return Int(timeIntervalSince1970.rounded())
    }
}
