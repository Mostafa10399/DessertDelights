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
        let launchRootViewModel = makeLaunchRootViewModel()
        let lunchRootView = makeLaunchRootView(viewModel: launchRootViewModel)
        return LaunchNavigationController(
            viewModel: sharedLaunchViewModel,
            lunchRootView: lunchRootView)
    }
    
    private func makeLaunchRootView(viewModel: LaunchRootViewModel) -> LaunchRootView {
        LaunchRootView(viewModel: viewModel)
    }
    
    private func makeLaunchRootViewModel() -> LaunchRootViewModel {
        LaunchRootViewModel(goToHomeNavigationView: sharedMainViewModel)
    }
}
