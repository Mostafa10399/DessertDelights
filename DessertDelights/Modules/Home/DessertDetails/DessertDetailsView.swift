//
//  DessertDetailsView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct DessertDetailsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: DessertDetailsViewModel
    @State private var didAppear: Bool = true
    
    // MARK: - CodeView
    var body: some View {
        GeometryReader(content: { geo in
            ScrollView(showsIndicators: false, content: {
                LazyVStack {
                    AsyncImage(url: viewModel.dessertImage, transaction: .init(animation: .bouncy(duration: 1)), content: { imageState in
                        switch imageState {
                        case .empty:
                             ZStack {
                                 Color.gray
                                     .opacity(0.4)
                                 ProgressView()
                             }
                        case .success(let image):
                                            image.resizable()
                        case .failure(_):
                            Image(.launchBackground)
                                .resizable()
                        @unknown default:
                            EmptyView()
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height * 0.35)
                    
                    Group {
                        HStack(content: {
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                            Text(viewModel.dessertArea)
                                .font(.custom("Poppins-Regular", size: 14))
                            Spacer()
                        })
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
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal, 12)
                        
                }
            })
            .padding(.bottom)
        })
        .navigationTitle(viewModel.dessertName)
        .frame(maxHeight: .infinity)
        .onAppear {
            if didAppear {
                viewModel.fetchDessertDetails()
                self.didAppear = false
            }
        }
        .displayLoader(isLoading: viewModel.isDataLoading)
        .displayError(errorMessage: viewModel.errorMessage, isFullScreen: false) {
            viewModel.didTapOnTryAgain()
        }
    }
}

