//
//  MainDependencyContainer .swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import Foundation

final class MainDependencyContainer {
    
    // MARK: - Properties
    
    let sharedMainViewModel: MainViewModel
    
    // MARK: - Methods
    
    init() {
        func makeMainViewModel() -> MainViewModel {
            MainViewModel()
        }
        self.sharedMainViewModel = makeMainViewModel()
    }
    
    func makeMainNavigationController() -> MainNavigationController {
        let launchNavigationControllerFactory = {
            self.makeLaunchNavigationController()
        }
        let homeNavigationControllerFactory = {
            self.makeHomeNavigationController()
        }
        return MainNavigationController(
            viewModel: sharedMainViewModel,
            launchNavigationControllerFactory: launchNavigationControllerFactory,
            homeNavigationControllerFactory: homeNavigationControllerFactory)
    }
    
    private func makeLaunchNavigationController() -> LaunchNavigationController {
        let dependency = LaunchDependencyContainer(parentDependencyContainer: self)
        return dependency.makeLaunchNavigationController()
    }
    
    private func makeHomeNavigationController() -> HomeNavigationController {
        let dependency = HomeDependencyContainer(parentDependencyContainer: self)
        return dependency.makeHomeNavigationController()
    }
    
}
