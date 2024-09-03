//
//  HomeView.swift
//  CryptoDemo
//
//  Created by Marcelo Mogrovejo on 02/09/2024.
//

import SwiftUI

// Source: https://www.youtube.com/watch?v=-QT_bEx-4zg


struct HomeView: View {

    @State var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
//            NavigationLink(destination: Text("Destination")) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
            
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView(viewModel: viewModel)

                Divider()

                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
        .task {
            do {
                try await viewModel.getAll()
            } catch {
                
            }
        }
    }
}

#Preview {
    HomeView()
}
