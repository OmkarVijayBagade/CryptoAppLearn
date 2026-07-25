//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var coins: [CoinModel] = []   //When this changes → UI updates automatically
    @Published var isLoading: Bool = false  // loading state (optional but useful)
    
    //MARK: top movers horizontal scroll view
    
    // 🧠 Pick top 5 coins with highest 24h gain
    var topMovers: [CoinModel] {
        
        // 1. Remove coins where change is nil
        let validCoins = coins.filter { $0.priceChangePercentage24H != nil }
        
        // 2. Sort descending (highest gain first)
        let sortedCoins = validCoins.sorted {
            ($0.priceChangePercentage24H ?? 0) > ($1.priceChangePercentage24H ?? 0)
        }
        
        // 3. Take top 5
        return Array(sortedCoins.prefix(5))
    }
    
    func fetchCoins() async {
        
        //UI should know loading started
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do{
            let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h"
            
            guard let url = URL(string: urlString) else {
                print("❌Bad URL")
                return
            }
            
            //API call
            let (data,_) = try await URLSession.shared.data(from:url)
            
            // 🧠 Decode JSON → Swift Model
            let decodedCoins = try JSONDecoder().decode(
                [CoinModel].self,
                from: data
            )
            
            //updating UI on main thread
            DispatchQueue.main.async {
                self.coins = decodedCoins
                self.isLoading = false
            }
            
            print(decodedCoins.first!)
            
        }catch{
            print("❌Error found: \(error)")
        }
        
        
        
    }
}
