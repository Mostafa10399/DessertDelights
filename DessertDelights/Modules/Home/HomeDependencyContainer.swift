//
//  HomeDependencyContainer.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

final class HomeDependencyContainer {
    
    // MARK: - Properties
    
    let sharedMainViewModel: MainViewModel
    let sharedHomeViewModel: HomeViewModel
    
    // MARK: - Methods
    
    init(parentDependencyContainer: MainDependencyContainer) {
        func makeHomeViewModel() -> HomeViewModel {
            HomeViewModel()
        }
        self.sharedMainViewModel = parentDependencyContainer.sharedMainViewModel
        self.sharedHomeViewModel = makeHomeViewModel()
    }
    
    func makeHomeNavigationController() -> HomeNavigationController {
        let homeRootView = makeHomeRootView()
        let dessertDetailsViewFactory = { (id: Int) in
            self.makeDessertDetailsView()
        }
        return HomeNavigationController(
            viewModel: sharedHomeViewModel,
            homeRootView: homeRootView,
            dessertDetailsViewFactory: dessertDetailsViewFactory)
    }
    
    private func makeHomeRootView() -> HomeRootView {
        HomeRootView()
    }
    
    private func makeDessertDetailsView() -> DessertDetailsView {
        DessertDetailsView()
    }
}
