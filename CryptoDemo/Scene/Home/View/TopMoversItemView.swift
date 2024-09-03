//
//  TopMoversItemView.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 02/09/2024.
//

import SwiftUI
/// Source: https://github.com/onevcat/Kingfisher
import Kingfisher

struct TopMoversItemView: View {

    let topMovingCoin: Coin

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: topMovingCoin.image)) 
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)

            HStack(spacing: 2) {
                Text(topMovingCoin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)

                Text(topMovingCoin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(topMovingCoin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(topMovingCoin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

#Preview {
    let topMovingCoin = Coin(id: "bitcoin",
                             symbol: "btc",
                             name: "Bitcoin",
                             image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                             currentPrice: 70187,
                             priceChange24H: 2126.88,
                             priceChangePercentage24H: 3.12502,
                             marketCapRank: 1)
    return TopMoversItemView(topMovingCoin: topMovingCoin)
}
