//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import SwiftUI

struct TopMoversView: View {
    
    let coins: [CoinModel]  //recieve data 
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:18){
                    ForEach(coins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    TopMoversView(coins: [
        CoinModel(
            id: "1",
            name: "Bitcoin",
            symbol: "BTC",
            image: "bitcoin",
            currentPrice: 50000,
            marketCapRank: 1,
            priceChangePercentage24H: 0.50),
        CoinModel(
            id: "2",
            name: "Ethereum",
            symbol: "ETH",
            image: "ethereum",
            currentPrice: 3000,
            marketCapRank: 2,
            priceChangePercentage24H: 1.20)
    ])
}
