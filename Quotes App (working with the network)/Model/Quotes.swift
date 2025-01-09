//
//  Quotes.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 9.01.25.
//

import Foundation

struct Quote: Decodable {
    let id: Int
    let quote: String
    let author: String
}

struct Quotes: Decodable {
    let quotes: [Quote]
    let total: Int
    let skip: Int
    let limit: Int

}
