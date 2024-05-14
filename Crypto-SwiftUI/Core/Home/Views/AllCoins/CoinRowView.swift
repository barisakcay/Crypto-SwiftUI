//
//  CoinRowView.swift
//  Crypto-SwiftUI
//
//  Created by Baris Akcay on 14.05.2024.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: CoinModel
    var body: some View {
        HStack {
            
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.green)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
        }
        .padding()
        .overlay(
        RoundedRectangle(cornerRadius: 2)
            .stroke(Color(.systemGray4), lineWidth: 1)
            .background(Color("ItemBackgroundColor"))
        )
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinRowView(coin: CoinModel)
//}
