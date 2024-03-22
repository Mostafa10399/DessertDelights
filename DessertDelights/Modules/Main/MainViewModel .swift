//
//  MainViewModel .swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import Foundation

final class MainViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var view: MainView
    
    // MARK: - Methods
    
    init() {
        self.view = .launch
    }
}

protocol GoToHomeNavigationController {
    func navigateToHomeNavigationController()
}
