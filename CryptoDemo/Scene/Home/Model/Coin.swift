//
//  Coin.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import Foundation

struct Coin: Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let priceChange24H, priceChangePercentage24H: Double
    let marketCapRank: Int?
}
