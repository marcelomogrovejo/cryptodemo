//
//  TopMoversView.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 02/09/2024.
//

import SwiftUI

struct TopMoversView: View {

    @State var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { topMovingCoin in
                        TopMoversItemView(topMovingCoin: topMovingCoin)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}
