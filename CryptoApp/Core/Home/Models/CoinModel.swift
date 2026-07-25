//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import Foundation
import Combine

struct CoinModel: Codable, Identifiable{
    
    //MARK: basic info
    let id: String
    let name: String
    let symbol: String
    
    //MARK: image
    let image: String
    
    //MARK: price
    let currentPrice: Double?
    
    // MARK: - Market Data
        let marketCapRank: Int?
        
    // MARK: - Change
    let priceChangePercentage24H: Double?
    
    //mapping JSON keys -> SwiftKeys
    enum CodingKeys: String, CodingKey {
        case id,name,symbol,image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}


