//
//  Data.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 9.01.25.
//

import Foundation

enum Links {
    case quotes

    var url: URL {
        switch self {
            case .quotes:
                return URL(string: "https://dummyjson.com/quotes")!
        }
    }
}
