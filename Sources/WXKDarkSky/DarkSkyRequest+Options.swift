//
//  DarkSkyRequest+Options.swift
//  WXKDarkSky
//
//  © 2020; MIT License.
//
//  Please see the included LICENSE file for details.
//

import Foundation

extension DarkSkyRequest {
    /// Options for loading data from the Dark Sky API.
    public class Options: Equatable {
        public static func == (lhs: DarkSkyRequest.Options, rhs: DarkSkyRequest.Options) -> Bool {
            if lhs.exclude == rhs.exclude &&
                lhs.extendHourly == rhs.extendHourly &&
                lhs.language == rhs.language &&
                lhs.units == rhs.units {
                return true
            } else {
                return false
            }
        }

        /// Data blocks to exclude from the response.
        public var exclude: [DataBlock]
        /// Indicates whether to extend the hourly forecast to a full week rather than 48 hours.
        public var extendHourly: Bool
        /// The language that should be used in the response.
        public var language: Language
        /// The units that should be used in the response.
        public var units: Units

        /// The default value to use for excluded data blocks.
        private static let excludeDefault: [DataBlock] = []
        /// The default value to use for whether to extend the hourly block.
        private static let extendHourlyDefault = false
        /// The default value to use for the response language.
        private static let languageDefault: Language = .english
        /// The default value to use for the response's measurement units.
        private static let unitsDefault: Units = .auto

        /// Returns the default set of options.
        public static let defaults = Options()

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
            - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
            - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
            - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
            - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public init(exclude: [DataBlock], extendHourly: Bool, language: Language, units: Units) {
            self.exclude = exclude
            self.extendHourly = extendHourly
            self.language = language
            self.units = units
        }

        // Massive string of convenience inits to cover the possible combinations of initialization conditions.
        /**
         Initializes the `Options` object with the default options.
         */
        public convenience init() {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock]) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
         */
        public convenience init(extendHourly: Bool) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: Options.languageDefault, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
         */
        public convenience init(language: Language) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: language, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
            - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
         */
        public convenience init(exclude: [DataBlock], extendHourly: Bool) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: Options.languageDefault, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock], language: Language) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: language, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock], units: Units) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
         */
        public convenience init(extendHourly: Bool, language: Language) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: language, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(extendHourly: Bool, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: Options.languageDefault, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(language: Language, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: language, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock], extendHourly: Bool, language: Language) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: language, units: Options.unitsDefault)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock], extendHourly: Bool, units: Units) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: Options.languageDefault, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - exclude: An array of data blocks (such as `.currently` and/or `.flags`) to exclude from the response. See the `DarkSkyRequest.DataBlock` enumeration for supported options.
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(exclude: [DataBlock], language: Language, units: Units) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: language, units: units)
        }

        /**
         Initializes the `Options` object with the provided configuration options.
         
         - parameters:
             - extendHourly: A `Bool` indicating whether the hourly forecast should be extended beyond 48 hours.
             - language: The language to use for the response. See the `DarkSkyRequest.Language` enumeration for supported options.
             - units: The units to use for the request. See the `DarkSkyRequest.Units` enumeration for supported options.
         */
        public convenience init(extendHourly: Bool, language: Language, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: language, units: units)
        }
    }
}
