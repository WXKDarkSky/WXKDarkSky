//
//  Language.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSkyRequest {
    /// Languages supported by the Dark Sky API.
    public enum Language: String, CustomStringConvertible {
        /// Indicates that a Dark Sky request should be handled in the Arabic language.
        case arabic = "ar"
        /// Indicates that a Dark Sky request should be handled in the Azerbaijani language.
        case azerbaijani = "az"
        /// Indicates that a Dark Sky request should be handled in the Belarusian language.
        case belarusian = "be"
        /// Indicates that a Dark Sky request should be handled in the Bulgarian language.
        case bulgarian = "bg"
        /// Indicates that a Dark Sky request should be handled in the Bosnian language.
        case bosnian = "bs"
        /// Indicates that a Dark Sky request should be handled in the Catalan language.
        case catalan = "ca"
        /// Indicates that a Dark Sky request should be handled in the Czech language.
        case czech = "cs"
        /// Indicates that a Dark Sky request should be handled in the Danish language.
        case danish = "da"
        /// Indicates that a Dark Sky request should be handled in the German language.
        case german = "de"
        /// Indicates that a Dark Sky request should be handled in the Greek language.
        case greek = "el"
        /// Indicates that a Dark Sky request should be handled in the English language.
        case english = "en"
        /// Indicates that a Dark Sky request should be handled in the Spanish language.
        case spanish = "es"
        /// Indicates that a Dark Sky request should be handled in the Estonian language.
        case estonian = "et"
        /// Indicates that a Dark Sky request should be handled in the Finnish language.
        case finnish = "fi"
        /// Indicates that a Dark Sky request should be handled in the French language.
        case french = "fr"
        /// Indicates that a Dark Sky request should be handled in the Hebrew language.
        case hebrew = "he"
        /// Indicates that a Dark Sky request should be handled in the Croatian language.
        case croatian = "hr"
        /// Indicates that a Dark Sky request should be handled in the Indonesian language.
        case indonesian = "id"
        /// Indicates that a Dark Sky request should be handled in the Icelandic language.
        case icelandic = "is"
        /// Indicates that a Dark Sky request should be handled in the Italian language.
        case italian = "it"
        /// Indicates that a Dark Sky request should be handled in the Japanese language.
        case japanese = "ja"
        /// Indicates that a Dark Sky request should be handled in the Georgian language.
        case georgian = "ka"
        /// Indicates that a Dark Sky request should be handled in the Korean language.
        case korean = "ko"
        /// Indicates that a Dark Sky request should be handled in the Cornish language.
        case cornish = "kw"
        /// Indicates that a Dark Sky request should be handled in the Bokmål language.
        case norwegianBokmal = "nb"
        /// Indicates that a Dark Sky request should be handled in the Dutch language.
        case dutch = "nl"
        /// Indicates that a Dark Sky request should be handled in the Polish language.
        case polish = "pl"
        /// Indicates that a Dark Sky request should be handled in the Portuguese language.
        case portuguese = "pt"
        /// Indicates that a Dark Sky request should be handled in the Romanian language.
        case romanian = "ro"
        /// Indicates that a Dark Sky request should be handled in the Russian language.
        case russian = "ru"
        /// Indicates that a Dark Sky request should be handled in the Slovak language.
        case slovak = "sk"
        /// Indicates that a Dark Sky request should be handled in the Slovenian language.
        case slovenian = "sl"
        /// Indicates that a Dark Sky request should be handled in the Serbian language.
        case serbian = "sr"
        /// Indicates that a Dark Sky request should be handled in the Swedish language.
        case swedish = "sv"
        /// Indicates that a Dark Sky request should be handled in the Tetum language.
        case tetum = "tet"
        /// Indicates that a Dark Sky request should be handled in the Turkish language.
        case turkish = "tr"
        /// Indicates that a Dark Sky request should be handled in the Ukrainian language.
        case ukrainian = "uk"
        /// Indicatesyay atthay ayay Arkday Yskay equestray ouldshay ebay andledhay inyay Igpay Atinlay.
        case pigLatin = "x-pig-latin"
        /// Indicates that a Dark Sky request should be handled in simplified Chinese.
        case simplifiedChinese = "zh"
        /// Indicates that a Dark Sky request should be handled in traditional Chinese.
        case traditionalChinese = "zh-tw"

        public var description: String {
            return rawValue
        }
    }
}
