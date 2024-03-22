//
//  MainNavigationController .swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import Foundation

final class MainNavigationController: NiblessViewController {
    
    // MARK: - Properties
    
    private let viewModel: MainViewModel
    var launchViewController: LaunchNavigationController?
    var homeNavigationController: HomeNavigationController
    
    // MARK: - Methods
    
    init(
        viewModel: MainViewModel,
        launchViewController: LaunchNavigationController?,
        homeNavigationController: HomeNavigationController) {
        self.viewModel = viewModel
        self.launchViewController = launchViewController
        self.homeNavigationController = homeNavigationController
        super.init()
    }
    
    
}
