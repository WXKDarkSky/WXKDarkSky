//
//  Error.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

/// The WXKDarkSkyError enum contains some possible error cases for errors that may be encountered in using WXKDarkSky.
public enum WXKDarkSkyError: String, Error {
    case couldNotRetrieveData = "Could not retrieve data. This error is likely on Dark Sky's end."
    case malformedResponse = "Could not decode data from Dark Sky into a WXKDarkSkyResponse object."
    case unspecified = "An unspecified error has occurred in creating the Dark Sky API request."

    public var localizedDescription: String {
        return rawValue
    }
}
