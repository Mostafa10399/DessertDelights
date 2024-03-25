//
//  HomeViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

final class HomeViewModel: GoToDessertDetailsView {

    // MARK: - Properties
    
    @Published private(set) var view: HomeView
    
    // MARK: - Methods
    
    init() {
        self.view = .root
    }
    
    func navigateToDessertDetailsView(by dessertId: String) {
        view = .dessertDetails(dessertId: dessertId)
    }
    
}

protocol GoToDessertDetailsView {
    func navigateToDessertDetailsView(by dessertId: String)
}
