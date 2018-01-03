//
//  DataBlock.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSky {
	/// Data blocks provided by the Dark Sky API. Used to exclude certain data blocks in a networking request.
	public enum DataBlock : String, CustomStringConvertible {
		/// The current conditions pertaining to the request.
		case currently = "currently"
		/// A minute-by-minute forecast for the next hour.
		case minutely = "minutely"
		/// An hourly forecast for the next 48 hours.
		case hourly = "hourly"
		/// A daily forecast for the next week.
		case daily = "daily"
		/// Any active alerts pertaining to the request.
		case alerts = "alerts"
		/// Metadata pertaining to the data provided in response to the request.
		case flags = "flags"
		
		public var description: String {
			return self.rawValue
		}
	}
}
