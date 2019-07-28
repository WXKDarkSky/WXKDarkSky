//
//  Error.swift
//  WXKDarkSky
//
//  © 2019 Loop Weather Services LLC. Licensed under the MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

/// The DarkSkyError enum contains some possible error cases for errors that may be encountered in using WXKDarkSky.
public enum DarkSkyError: String, Error {
    /**
     The DarkSkyRequest class failed to retrieve data from the Dark Sky API.
     
     If this error is returned, it is probably on Dark Sky's end, but you may wish to check to be sure that your API key is current and network connection is up.
     */
    case couldNotRetrieveData = "Could not retrieve Dark Sky data."
    /**
     The DarkSkyRequest class failed to decode the response into a DarkSkyResponse object.
     
     This error means that some data was retrieved from the Dark Sky API, but it was not in the very specific format that is expected by the DarkSkyResponse structure for decoding.
     */
    case malformedResponse = "Could not decode data from Dark Sky into a DarkSkyResponse object."
    /**
     An unspecified error occurred.
     */
    case unspecified = "An unspecified error has occurred in creating the Dark Sky API request."

    /**
     A description for the error that occurred.
     */
    public var localizedDescription: String {
        return rawValue
    }
}
