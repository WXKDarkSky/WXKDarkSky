//
//  Options.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSkyRequest {
    /// Options for loading data from the Dark Sky API.
    public class Options: Equatable {
        public static func == (lhs: WXKDarkSkyRequest.Options, rhs: WXKDarkSkyRequest.Options) -> Bool {
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

        public init(exclude: [DataBlock], extendHourly: Bool, language: Language, units: Units) {
            self.exclude = exclude
            self.extendHourly = extendHourly
            self.language = language
            self.units = units
        }

        // Massive string of convenience inits to cover the possible combinations of initialization conditions.
        public convenience init() {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: Options.unitsDefault)
        }

        public convenience init(exclude: [DataBlock]) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: Options.unitsDefault)
        }

        public convenience init(extendHourly: Bool) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: Options.languageDefault, units: Options.unitsDefault)
        }

        public convenience init(language: Language) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: language, units: Options.unitsDefault)
        }

        public convenience init(units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: units)
        }

        public convenience init(exclude: [DataBlock], extendHourly: Bool) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: Options.languageDefault, units: Options.unitsDefault)
        }

        public convenience init(exclude: [DataBlock], language: Language) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: language, units: Options.unitsDefault)
        }

        public convenience init(exclude: [DataBlock], units: Units) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: Options.languageDefault, units: units)
        }

        public convenience init(extendHourly: Bool, language: Language) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: language, units: Options.unitsDefault)
        }

        public convenience init(extendHourly: Bool, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: Options.languageDefault, units: units)
        }

        public convenience init(language: Language, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: Options.extendHourlyDefault, language: language, units: units)
        }

        public convenience init(exclude: [DataBlock], extendHourly: Bool, language: Language) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: language, units: Options.unitsDefault)
        }

        public convenience init(exclude: [DataBlock], extendHourly: Bool, units: Units) {
            self.init(exclude: exclude, extendHourly: extendHourly, language: Options.languageDefault, units: units)
        }

        public convenience init(exclude: [DataBlock], language: Language, units: Units) {
            self.init(exclude: exclude, extendHourly: Options.extendHourlyDefault, language: language, units: units)
        }

        public convenience init(extendHourly: Bool, language: Language, units: Units) {
            self.init(exclude: Options.excludeDefault, extendHourly: extendHourly, language: language, units: units)
        }
    }
}
