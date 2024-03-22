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
        MainNavigationController(
            viewModel: sharedMainViewModel,
            launchViewController: <#T##LaunchNavigationController?#>,
            homeNavigationController: <#T##HomeNavigationController#>)
    }
    
    private func makeLaunchNavigationController() -> LaunchNavigationController {
        let dependency = LaunchDependencyContainer()
    }
    
}
