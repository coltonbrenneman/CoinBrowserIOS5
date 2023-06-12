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
        
        URLSession.shared.dataTask(with: finalURL) { coinData, _, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)") ; completion(false)
            } //End of error
            guard let data = coinData else {
                return ; completion(false)
            } //End of data
            do {
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data) as? [[String : String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let coin = Coin(dictionary: coinDictionary) {
                            coins.append(coin)
                        }
                    }
                }
                completion(true)
            } catch {
                completion(false)
            } //End of do try catch
        }.resume() //End of dataTask
    } //End of fetchCoins
} //End of class
