//
//  ExchangeRates.swift
//  Currency Converter
//
//  Created by Neskin Ivan on 24.07.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import Foundation


struct ExchangeRates: Codable {
    let valute: [String: Valute]
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}

struct Valute: Codable {
    let id, numCode, charCode: String
    let nominal: Int
    let name: String
    let value, previous: Double

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
