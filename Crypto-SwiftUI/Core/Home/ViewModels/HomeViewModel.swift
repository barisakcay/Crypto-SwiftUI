//
//  HomeViewModel.swift
//  Crypto-SwiftUI
//
//  Created by Baris Akcay on 14.05.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var coins = [CoinModel]()
    @Published var topMovingCoins = [CoinModel]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("URL Session Error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response Code: \(response.statusCode)")
            }
            
            guard let data else { return }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            }catch let error {
                print("Failed to decode with error: \(error)")
            }
            
        }.resume()
        
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H } )
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
    
    
    
}
