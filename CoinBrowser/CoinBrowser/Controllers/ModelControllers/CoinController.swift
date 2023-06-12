//
//  CoinController.swift
//  CoinBrowser
//
//  Created by Colton Brenneman on 6/12/23.
//

import Foundation

class CoinController {
    
    // MARK: - Properties
    static var coins: [Coin] = []
    private static let baseURLString = "https://api.coingecko.com/api/v3"
    private static let keyCoinsComponent = "/coins"
    private static let keyListComponent = "/list"
    //finalURL https://api.coingecko.com/api/v3/coins/list
    
    // MARK: - CRUD
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        guard let baseURL = URL(string: baseURLString) else { return completion(false) }
        let coinsURL = baseURL.appending(path: keyCoinsComponent)
        let finalURL = coinsURL.appending(path: keyListComponent)
        print(finalURL)
    } //End of class
}
