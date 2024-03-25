//
//  HomeRootView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct HomeRootView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: HomeRootViewModel
    @State private var didAppear: Bool = true
    
    // MARK: - CodeView
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
            viewModel.desserts.map { desserts in
                LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center, spacing: 12, content: {
                    ForEach(desserts, id: \.id) { item in
                        DessertCell(width: geo.size.width / 2.1, dessert: item)
                            .onTapGesture {
                                viewModel.didTapOnDessert()
                            }
                    }
                })
                .frame(maxWidth: .infinity)
            }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 12)
        .navigationTitle("Find Your Favorite Dessert")
        .onAppear {
            if didAppear {
                viewModel.setDesserts()
                self.didAppear = false
            }
        }
        .displayLoader(isLoading: viewModel.isDataLoading)
    }
}

#Preview {
    HomeRootView(viewModel: HomeRootViewModel(filterRepository: MainFilterRepository(remoteApi: DessertDelightsFilterApis()), goToDessertDetailsView: HomeViewModel()))
}


