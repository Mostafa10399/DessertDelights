//
//  HomeRootViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation
import protocol CoreKit.GetAllDessertsUseCase
import protocol CoreKit.DessertRepository
import struct CoreKit.DessertPresentable
import protocol Commons.BaseViewModel
import enum NetworkLayer.APIError

final class HomeRootViewModel: ObservableObject, GetAllDessertsUseCase, BaseViewModel {    
        
    // MARK: - Properties
    
    var dessertRepository: DessertRepository
    private let goToDessertDetailsView: GoToDessertDetailsView
    @Published var isDataLoading: Bool
    @Published var errorMessage: APIError?
    @Published var desserts: [DessertPresentable]?
    
    // MARK: - Methods
    
    init(
        dessertRepository: DessertRepository,
        goToDessertDetailsView: GoToDessertDetailsView) {
            self.dessertRepository = dessertRepository
            self.goToDessertDetailsView = goToDessertDetailsView
            self.isDataLoading = false
        }
    
    @MainActor
    func didTapOnTryAgain() {
        setErrorMessage(nil)
        setDesserts()
    }
    
    
    func setDesserts() {
        Task { @MainActor [weak self] in
            guard let strongSelf = self else { return }
            defer { strongSelf.setIsDataLoading(false) }
            do {
                strongSelf.setIsDataLoading(true)
                strongSelf.desserts = try await strongSelf.getAllDesserts()
            } catch let error as APIError {
                strongSelf.setErrorMessage(error)
            }
        }
    }
    
    func didTapOnDessert(dessertId: String) {
        goToDessertDetailsView.navigateToDessertDetailsView(by: dessertId)
    }
}
