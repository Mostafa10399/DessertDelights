//
//  HomeRootViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class HomeRootViewModel: ObservableObject, GetAllDessertsUseCase {
        
    // MARK: - Properties
    
    var filterRepository: FilterRepository
    @Published private(set) var isDataLoading: Bool
    @Published var errorMessage: ErrorMessage?
    var desserts: [DessertPresentable]?
    
    // MARK: - Methods
    
    init(filterRepository: FilterRepository) {
        self.filterRepository = filterRepository
        self.isDataLoading = false
    }
    
    func setDesserts() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            defer {
                strongSelf.setIsDataLoading(false)
            }
            do {
                strongSelf.setIsDataLoading(true)
                strongSelf.desserts = try await strongSelf.getAllDesserts()
            } catch let errorMessage as ErrorMessage {
                strongSelf.setErrorMessage(errorMessage)
            }
        }
    }
    
    private func setIsDataLoading(_ value: Bool) {
        DispatchQueue
            .main
            .async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.isDataLoading = value
            }
    }
    
    private func setErrorMessage(_ value: ErrorMessage) {
        DispatchQueue
            .main
            .async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.errorMessage = value
            }
    }
    
}
