//
//  Error.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

public enum WXKDarkSkyError : Error {
	case couldNotRetrieveData
	case malformedResponse
	
	public var localizedDescription: String {
		switch self {
		case .couldNotRetrieveData:
			return "Could not retrieve data. This error is likely on Dark Sky's end."
		case .malformedResponse:
			return "Could not decode data from Dark Sky into a WXKDarkSkyResponse object."
		}
	}
}
