//
//  HomeNavigationController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import SwiftUI
import Combine
import class Commons.NiblessNavigationController

final class HomeNavigationController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    private let homeRootView: HomeRootView
    private let makeDessertDetailsView: ((String) -> DessertDetailsView)
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    init(
        viewModel: HomeViewModel,
        homeRootView: HomeRootView,
        dessertDetailsViewFactory: @escaping (String) -> DessertDetailsView) {
            self.viewModel = viewModel
            self.homeRootView = homeRootView
            self.makeDessertDetailsView = dessertDetailsViewFactory
            self.cancellable = []
            super.init()
            let vc = UIHostingController(rootView: homeRootView)
            vc.with {
                let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                backBarButtonItem.tintColor = UIColor.accent
                $0.navigationItem.backBarButtonItem = backBarButtonItem
            }
            viewControllers = [vc]
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
            .foregroundColor: UIColor.black12,
            .font: UIFont(name: "Poppins-SemiBold", size: 16) ?? .systemFont(ofSize: 16)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black12,
            .font: UIFont(name: "Poppins-Bold", size: 24) ?? .systemFont(ofSize: 24)
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
        case let .dessertDetails(dessertId):
            presentDessertDetailsView(id: dessertId)
        }
    }
    
    private func presentHomeRootView() {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    private func presentDessertDetailsView(id: String) {
        let vc = UIHostingController(rootView: makeDessertDetailsView(id)).with { $0.modalPresentationStyle = .overFullScreen }
        pushViewController(vc, animated: true)
    }
    
}
