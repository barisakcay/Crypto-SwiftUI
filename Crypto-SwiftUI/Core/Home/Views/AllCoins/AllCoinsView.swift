//
//  AllCoinsView.swift
//  Crypto-SwiftUI
//
//  Created by Baris Akcay on 14.05.2024.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .padding()
            .font(.caption)
            .foregroundStyle(.gray)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}
