//
//  HomeNavigationController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import SwiftUI
import Combine

final class HomeNavigationController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    private let homeRootView: HomeRootView
    private let makeDessertDetailsView: ((Int) -> DessertDetailsView)
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    init(
        viewModel: HomeViewModel,
        homeRootView: HomeRootView,
        dessertDetailsViewFactory: @escaping (Int) -> DessertDetailsView) {
            self.viewModel = viewModel
            self.homeRootView = homeRootView
            self.makeDessertDetailsView = dessertDetailsViewFactory
            self.cancellable = []
            super.init()
            viewControllers = [UIHostingController(rootView: homeRootView)]
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeToViewModel()
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Poppins-SemiBold", size: 14) ?? .systemFont(ofSize: 14)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Poppins-SemiBold", size: 24) ?? .systemFont(ofSize: 14)
        ]
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    private func observeToViewModel() {
        let publisher = viewModel.$view.eraseToAnyPublisher()
        subscribe(to: publisher)
    }
    
    private func subscribe(to publisher: AnyPublisher<HomeView, Never>) {
        publisher
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.present($0)
            }
            .store(in: &cancellable)
    }
    
    private func present(_ view: HomeView) {
        switch view {
        case .root:
            presentHomeRootView()
        case .dessertDetails:
            presentDessertDetailsView()
        }
    }
    
    private func presentHomeRootView() {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    private func presentDessertDetailsView() {
        
    }
    
}
