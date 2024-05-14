//
//  HomeView.swift
//  Crypto-SwiftUI
//
//  Created by Baris Akcay on 14.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
