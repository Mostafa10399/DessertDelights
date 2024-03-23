//
//  LaunchRootViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

final class LaunchRootViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let goToHomeNavigationView: GoToHomeNavigationController
    
    // MARK: - Methods
    
    init(goToHomeNavigationView: GoToHomeNavigationController) {
        self.goToHomeNavigationView = goToHomeNavigationView
    }
    
    func viewDidAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.goToHomeNavigationView.navigateToHomeNavigationController()
        }
    }
    
}
