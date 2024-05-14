//
//  TopMoversItemView.swift
//  Crypto-SwiftUI
//
//  Created by Baris Akcay on 14.05.2024.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack(alignment: .center) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.green)
                .padding(.bottom, 8)
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 1)
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
            
        )
    }
}
