//
//  HomeRootView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct HomeRootView: View {
    
    // MARK: - Properties
    
    // MARK: - CodeView
    
    var body: some View {
        GeometryReader { geo in
        ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center, spacing: 12, content: {
                    ForEach(0..<20) { item in
                        DessertCell(width: geo.size.width / 2.1)
                    }
                })
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 12)
        .navigationTitle("Find Your Favorite Dessert")
    }
}

#Preview {
    HomeRootView()
}


