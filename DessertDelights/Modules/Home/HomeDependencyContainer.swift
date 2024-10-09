//
//  HomeDependencyContainer.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation
import protocol CoreKit.DessertRepository
import class CoreKit.DessertDelightsDessertApis
import class CoreKit.MainDessertRepository

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
        let dessertDetailsViewFactory = { (id: String) in
            let viewModel = self.makeDessertDetailsViewModel(dessertId: id)
            return self.makeDessertDetailsView(viewModel: viewModel)
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
        let dessertRepository = makeDessertRepository()
        return HomeRootViewModel(
            dessertRepository: dessertRepository,
            goToDessertDetailsView: sharedHomeViewModel)
    }
    
    private func makeDessertRepository() -> DessertRepository {
        MainDessertRepository(remoteApi: DessertDelightsDessertApis())
    }
    
    private func makeDessertDetailsViewModel(dessertId: String) -> DessertDetailsViewModel {
        DessertDetailsViewModel(
            dessertId: dessertId,
            dessertRepository: makeDessertRepository())
    }
    
    private func makeDessertDetailsView(viewModel: DessertDetailsViewModel) -> DessertDetailsView {
        DessertDetailsView(viewModel: viewModel)
    }
}
