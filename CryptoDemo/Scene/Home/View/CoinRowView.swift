//
//  CoinRowView.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import SwiftUI
/// Source: https://github.com/onevcat/Kingfisher
import Kingfisher

struct CoinRowView: View {

    let coin: Coin

    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)

            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)

            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    let coin = Coin(id: "bitcoin",
                    symbol: "btc",
                    name: "Bitcoin",
                    image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                    currentPrice: 70187,
                    priceChange24H: 2126.88,
                    priceChangePercentage24H: 3.12502,
                    marketCapRank: 1)
    return CoinRowView(coin: coin)
}
