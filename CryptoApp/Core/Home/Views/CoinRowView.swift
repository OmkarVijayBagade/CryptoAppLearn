//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
        HStack(spacing:16){
            //market cap rank
            Text("\(coin.marketCapRank ?? 0)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            //image
            AsyncImage(url: URL(string: coin.image)){image in
                    image
                    .resizable()
                    .frame(width: 32, height: 32)
                    
            }placeholder: {
                ProgressView()
            }
            .frame(width: 30,height: 30)
    
            //vstack texts
            VStack(alignment: .leading){
                Text("\(coin.name)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("\(coin.symbol.uppercased())")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            //vstack price percentage
            VStack(alignment: .trailing){
                Text("$\(coin.currentPrice ?? 0, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("\(coin.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
                    .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
            }
            
        }
        .padding()
    }
}

#Preview {
    CoinRowView(
        coin: CoinModel.init(
            id: "1",
            name: "Bitcoin",
            symbol: "BTC",
            image: "bitcoin",
            currentPrice: 50000,
            marketCapRank: 1,
            priceChangePercentage24H: 0.50)
    )
}
