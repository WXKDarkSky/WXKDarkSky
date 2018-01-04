//
//  Point.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSky {
	/// Encapsulates a latitude-longitude coordinate pair.
	public struct Point : CustomStringConvertible {
		/// A latitude coordinate.
		public var latitude: Double
		/// A longitude coordinate.
		public var longitude: Double
		
		public var description: String {
			return String(describing: latitude) + "," + String(describing: longitude)
		}
	}
}
