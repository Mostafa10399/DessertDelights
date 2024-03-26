//
//  HomeRootViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class HomeRootViewModel: ObservableObject, GetAllDessertsUseCase, ScreenStateProtocol {
        
    // MARK: - Properties
    
    var dessertRepository: DessertRepository
    private let goToDessertDetailsView: GoToDessertDetailsView
    @Published var isDataLoading: Bool
    @Published var errorMessage: ErrorMessage? 
    var desserts: [DessertPresentable]?
    
    // MARK: - Methods
    
    init(
        dessertRepository: DessertRepository,
        goToDessertDetailsView: GoToDessertDetailsView) {
            self.dessertRepository = dessertRepository
            self.goToDessertDetailsView = goToDessertDetailsView
            self.isDataLoading = false
        }
    
    func didTapOnTryAgain() {
        setErrorMessage(nil)
        setDesserts()
    }
    
    func setDesserts() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            defer { strongSelf.setIsDataLoading(false) }
            do {
                strongSelf.setIsDataLoading(true)
                strongSelf.desserts = try await strongSelf.getAllDesserts()
            } catch let errorMessage as ErrorMessage {
                strongSelf.setErrorMessage(errorMessage)
            }
        }
    }
    
    func didTapOnDessert(dessertId: String) {
        goToDessertDetailsView.navigateToDessertDetailsView(by: dessertId)
    }
}
