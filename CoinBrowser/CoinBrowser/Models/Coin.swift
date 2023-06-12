//
//  Coin.swift
//  CoinBrowser
//
//  Created by Colton Brenneman on 6/12/23.
//

import Foundation

class Coin {
    
    let id: String
    let symbol: String
    let name: String
    
    // Fail-able initializer
    init?(dictionary: [String : String]) {
        // We have to unwrap the optionals
        guard let id = dictionary["id"],
        let symbol = dictionary["symbol"],
        let name = dictionary["name"] else { return nil }
        
        self.id = id
        self.symbol = symbol
        self.name = name
    }
} //end of class
