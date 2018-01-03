//
//  Language.swift
//  WXKDarkSkyPackageDescription
//
//  Created by Jonathan Thornton on 1/3/18.
//

import Foundation

extension WXKDarkSky {
	/// Languages supported by the Dark Sky API.
	public enum Language : String, CustomStringConvertible {
		case arabic = "ar"
		case azerbaijani = "az"
		case belarusian = "be"
		case bulgarian = "bg"
		case bosnian = "bs"
		case catalan = "ca"
		case czech = "cs"
		case danish = "da"
		case german = "de"
		case greek = "el"
		case english = "en"
		case spanish = "es"
		case estonian = "et"
		case finnish = "fi"
		case french = "fr"
		case croatian = "hr"
		case indonesian = "id"
		case icelandic = "is"
		case italian = "it"
		case japanese = "ja"
		case georgian = "ka"
		case cornish = "kw"
		case norwegianBokmal = "nb"
		case dutch = "nl"
		case polish = "pl"
		case portuguese = "pt"
		case romanian = "ro"
		case russian = "ru"
		case slovak = "sk"
		case slovenian = "sl"
		case serbian = "sr"
		case swedish = "sv"
		case tetum = "tet"
		case turkish = "tr"
		case ukrainian = "uk"
		case pigLatin = "x-pig-latin"
		case simplifiedChinese = "zh"
		case traditionalChinese = "zh-tw"
		
		public var description: String {
			return self.rawValue
		}
	}
}
