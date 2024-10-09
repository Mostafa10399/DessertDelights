//
//  MainNavigationController .swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import Foundation
import Combine
import class Commons.NiblessViewController

final class MainNavigationController: NiblessViewController {
    
    // MARK: - Properties
    
    private let viewModel: MainViewModel
    private var launchNavigationController: LaunchNavigationController?
    private var homeNavigationController: HomeNavigationController?
    private let makeLaunchNavigationController: (() -> LaunchNavigationController)
    private let makeHomeNavigationController: (() -> HomeNavigationController)
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    init(
        viewModel: MainViewModel,
        launchNavigationControllerFactory: @escaping () -> LaunchNavigationController,
        homeNavigationControllerFactory: @escaping () -> HomeNavigationController) {
            self.viewModel = viewModel
            self.makeLaunchNavigationController = launchNavigationControllerFactory
            self.makeHomeNavigationController = homeNavigationControllerFactory
            self.cancellable = []
            super.init()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeToViewModel()
    }
    
    private func observeToViewModel() {
        let publisher = viewModel.$view.eraseToAnyPublisher()
        subscribe(to: publisher)
    }
    
    private func subscribe(to publisher: AnyPublisher<MainView, Never>) {
        publisher
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.present($0)
            }
            .store(in: &cancellable)
    }
    
    private func present(_ view: MainView) {
        switch view {
        case .launch:
            presentLaunchNavigationController()
        case .home:
            presentHomeNavigationController()
        }
    }
    
    private func presentLaunchNavigationController() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.launchNavigationController = strongSelf.makeLaunchNavigationController()
            guard let launchNavigationController = strongSelf.launchNavigationController else { return }
            strongSelf.addFullScreen(childViewController: launchNavigationController, animation: true)
            strongSelf.remove(childViewController: strongSelf.homeNavigationController)
        }
    }
    
    private func presentHomeNavigationController() {
        DispatchQueue.main.async {
            self.homeNavigationController = self.makeHomeNavigationController()
            guard let homeNavigationController = self.homeNavigationController else { return }
            self.addFullScreen(childViewController: homeNavigationController, animation: true)
            self.remove(childViewController: self.launchNavigationController)
            self.launchNavigationController = nil
        }
    }
    
}
