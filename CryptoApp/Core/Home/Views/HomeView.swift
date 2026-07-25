//
//  HomeView.swift
//  CryptoApp
//
//  Created by Omkar Vijay Bagade on 25/07/26.
//

import SwiftUI

struct HomeView: View {
    
    //Connect ViewModel
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){
                
                //top movers
                TopMoversView(coins: vm.topMovers)
                
                Divider()
                
                //all coins
                VStack{
                    AllCoinsView()
                    
                    //dummy data
//                    ForEach(0..<15){_ in
//                        CoinRowView()
//                    }
                    
                    //🔥real data
                    ForEach(vm.coins){ coin in
                            CoinRowView(coin: coin)
                    }
                    
                }
                
            }
            .navigationTitle("Live Prices")
        }
        // 🚀 call API when screen appears
        .task {
            await vm.fetchCoins()
        }
    }
}

#Preview {
    HomeView()
}
