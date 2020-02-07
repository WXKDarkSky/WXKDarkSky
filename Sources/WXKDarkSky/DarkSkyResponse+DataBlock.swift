//
//  DarkSkyResponse+DataBlock.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

@available(*, renamed: "DarkSkyResponse.DataBlock")
public typealias DarkSkyDataBlock = DarkSkyResponse.DataBlock

extension DarkSkyResponse {
    /// The `DataBlock` struct contains an array of data points for a period of time, such as hourly forecasts for the next 2 days or daily forecasts for the next week.
    public struct DataBlock: Codable {
        /// An array of data points for the data block. This is required (but could be empty).
        public var data: [DarkSkyResponse.DataPoint]
        /// A string summarizing the data block.
        public var summary: String?
        /// An icon name from Dark Sky summarizing the data block.
        public var icon: String?
    }
}
