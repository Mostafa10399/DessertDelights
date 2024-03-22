//
//  LaunchDependencyContainer.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

final class LaunchDependencyContainer {
    
    // MARK: - Properties
    
    let sharedMainViewModel: MainViewModel
    let sharedLaunchViewModel: LaunchViewModel
    
    // MARK: - Methods
    
    init(parentDependencyContainer: MainDependencyContainer) {
        func makeLaunchViewModel() -> LaunchViewModel {
            LaunchViewModel()
        }
        self.sharedMainViewModel = parentDependencyContainer.sharedMainViewModel
        self.sharedLaunchViewModel =  makeLaunchViewModel()
    }
    
    func makeLaunchNavigationController() -> LaunchNavigationController {
        return LaunchNavigationController(
            viewModel: sharedLaunchViewModel,
            lunchRootView: LaunchRootView())
    }
}
