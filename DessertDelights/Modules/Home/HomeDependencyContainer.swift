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
        let homeRootViewModel = makeHomeRootViewModel()
        let homeRootView = makeHomeRootView(viewModel: homeRootViewModel)
        let dessertDetailsViewFactory = { (id: Int) in
            self.makeDessertDetailsView()
        }
        return HomeNavigationController(
            viewModel: sharedHomeViewModel,
            homeRootView: homeRootView,
            dessertDetailsViewFactory: dessertDetailsViewFactory)
    }
    
    private func makeHomeRootView(viewModel: HomeRootViewModel) -> HomeRootView {
        HomeRootView(viewModel: viewModel)
    }
    
    private func makeHomeRootViewModel() -> HomeRootViewModel {
        let filterRepository = makeFilterRepository()
        return HomeRootViewModel(
            filterRepository: filterRepository,
            goToDessertDetailsView: sharedHomeViewModel)
    }
    
    private func makeFilterRepository() -> FilterRepository {
        MainFilterRepository(remoteApi: DessertDelightsFilterApis())
    }
    
    private func makeDessertDetailsView() -> DessertDetailsView {
        DessertDetailsView()
    }
}
