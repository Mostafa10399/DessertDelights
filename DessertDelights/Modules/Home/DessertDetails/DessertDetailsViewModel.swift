//
//  DessertDetailsViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation
import protocol CoreKit.GetDessertDetailsUseCase
import protocol CoreKit.DessertRepository
import struct CoreKit.DessertDetailsPresentable
import protocol Commons.BaseViewModel

final class DessertDetailsViewModel: BaseViewModel, GetDessertDetailsUseCase {
    
    // MARK: - Properties
    
    private let dessertId: String
    var dessertRepository: DessertRepository
    var dessertName: String
    var dessertImage: URL?
    var dessertArea: String
    var dessertInstructions: String
    var dessertIngredient: [String]
    @Published var isDataLoading: Bool
    @Published var errorMessage: Error?
    
    // MARK: - Methods
    
    init(
        dessertId: String,
        dessertRepository: DessertRepository) {
            self.dessertId = dessertId
            self.dessertRepository = dessertRepository
            self.isDataLoading = false
            self.dessertName = ""
            self.dessertArea = ""
            self.dessertInstructions = ""
            self.dessertIngredient = []
        }
    
    @MainActor
    func didTapOnTryAgain() {
        setErrorMessage(nil)
        fetchDessertDetails()
    }
    
    func fetchDessertDetails() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            do {
                await strongSelf.setIsDataLoading(true)
                let dessertData = try await strongSelf.getDessertDetails(by: strongSelf.dessertId)
                strongSelf.setScreenData(dessertDetails: dessertData)
            } catch {
                await strongSelf.setErrorMessage(error)
            }
            await strongSelf.setIsDataLoading(false)
        }
    }
    
    private func setScreenData(dessertDetails: DessertDetailsPresentable) {
        self.setDessertName(dessertDetails.dessertName)
        self.setDessertImage(dessertDetails.dessertImageUrl)
        self.setDessertArea(dessertDetails.dessertArea)
        self.setDessertInstructions(dessertDetails.instructions)
        self.setDessertIngredient(dessertDetails.ingredient)
    }
    
    private func setDessertName(_ name: String) {
        self.dessertName = name
    }
    
    private func setDessertImage(_ url: URL?) {
        self.dessertImage = url
    }
    
    private func setDessertArea(_ area: String) {
        self.dessertArea = area
    }
    
    private func setDessertInstructions(_ instructions: String) {
        self.dessertInstructions = instructions
    }
    
    private func setDessertIngredient(_ ingredients: [String]) {
        self.dessertIngredient = ingredients
    }
    
}
