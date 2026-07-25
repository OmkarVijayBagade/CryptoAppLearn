//
//  CoinView.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("All Coins")
                .font(.headline)
            
            HStack{
                Text("Coin")
                
                Spacer()
                
                Text("Price")
            }
            .font(.caption)
            .foregroundStyle(.gray)
            
        }
        .padding()
        
    }
}

#Preview {
    AllCoinsView()
}
