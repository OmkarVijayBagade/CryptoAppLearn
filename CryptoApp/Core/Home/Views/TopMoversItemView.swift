//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import SwiftUI

struct TopMoversItemView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack(alignment:.leading){
            
            //image
            AsyncImage(url: URL(string: coin.image)){image in
                image
                    .resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            
            //coin info
            HStack(spacing:2){
                Text(coin.name)
                    .font(.caption)
                    .bold()
                
                Text("$\(coin.currentPrice ?? 0, specifier: "%.2f")")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            //percentage
            Text("\(coin.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
        
        }
        .frame(width: 140, height: 140)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
                
        }
    }
}

#Preview {
    TopMoversItemView(
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
