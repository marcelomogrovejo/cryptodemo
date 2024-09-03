//
//  HomeViewModel.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import SwiftUI
import CryptoRepoPackage

@Observable
class HomeViewModel {

    let apiService: ApiService
    var coins: [Coin] = []
    var topMovingCoins: [Coin] = []

    init() {
        self.apiService = ApiService()
    }

    func getAll() async throws {
        do {
            let domainCoins = try await self.apiService.getCoinsWithMarkets()
            self.coins = domainCoins.map{ domainCoin in
                Coin(id: domainCoin.id,
                     symbol: domainCoin.symbol,
                     name: domainCoin.name,
                     image: domainCoin.image,
                     currentPrice: domainCoin.currentPrice,
                     priceChange24H: domainCoin.priceChange24H,
                     priceChangePercentage24H: domainCoin.priceChangePercentage24H,
                     marketCapRank: Int(domainCoin.marketCapRank ?? 0))
            }
            self.configTopMovingCoins()
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }

    private func configTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
