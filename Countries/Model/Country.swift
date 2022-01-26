//
//  File.swift
//  Countries
//
//  Created by MAC on 22/01/22.
//

import Foundation

struct Country: Codable {
    
    var alpha2Code: String?
    var alpha3Code: String?
    var altSpellings: [String]?
    var area: Double?
    var borders: [String]?
    var callingCodes: [String]?
    var capital: String?
    var currencies: [Currency]?
    var demonym: String?
    var flag: String?
    var gini: Double?
    var languages: [Language]?
    var latlng: [Double]?
    var name: String?
    var nativeName:  String?
    var numericCode: String?
    var population: Int?
    var region: String?
    var regionalBlocs: [RegionalBloc]?
    var subregion: String?
    var timezone: [String]?
    var topLevelDomain: [String]?
    var translations: Translations?
    var cioc: String?
    
}
