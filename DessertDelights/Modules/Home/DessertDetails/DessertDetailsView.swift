//
//  DessertDetailsView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI
import struct Commons.CustomWebImage

struct DessertDetailsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: DessertDetailsViewModel
    @State private var didAppear: Bool = true
    
    // MARK: - CodeView
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 16) {
                CustomWebImage(url: viewModel.dessertImage, placeholder: {
                       Image(.launchBackground)
                           .resizable()
                   })
                   .aspectRatio(contentMode: .fill)
                   .frame(maxWidth: .infinity)
                   .clipShape(RoundedRectangle(cornerRadius: 6))
                Group {
                    HStack {
                        Image(systemName: "map.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.accent)
                        Text(viewModel.dessertArea)
                            .font(.custom("Poppins-Regular", size: 14))
                        Spacer()
                    }
                    Text(viewModel.dessertInstructions)
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundStyle(.darkGray10)
                    if !viewModel.dessertIngredient.isEmpty {
                        Text("Ingredients & Measurements")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom("Poppins-Bold", size: 18))
                            .foregroundStyle(.black12)
                        ForEach(viewModel.dessertIngredient, id: \.self) { ingredientAndMeasures in
                            HStack {
                                Circle()
                                    .fill(Color(.accent))
                                    .frame(width: 5, height: 5)
                                Text(ingredientAndMeasures)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("Poppins-Regular", size: 13))
                                    .foregroundStyle(.darkGray10)
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationTitle(viewModel.dessertName)
        .frame(maxHeight: .infinity)
        .onAppear {
            if didAppear {
                viewModel.fetchDessertDetails()
                self.didAppear = false
            }
        }
        .displayLoader(isLoading: viewModel.isDataLoading)
        .displayError(errorMessage: viewModel.errorMessage) {
            viewModel.didTapOnTryAgain()
        }
    }
}
