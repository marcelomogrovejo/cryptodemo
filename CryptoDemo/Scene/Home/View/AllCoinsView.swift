//
//  AllCoinsView.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import SwiftUI

struct AllCoinsView: View {

    @State var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .padding()

            HStack {
                Text("Coin")

                Spacer()

                Text("Price")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)

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

#Preview {
    AllCoinsView(viewModel: HomeViewModel())
}
