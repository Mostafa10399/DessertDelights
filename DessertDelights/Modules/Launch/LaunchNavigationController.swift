//
//  LaunchNavigationController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import SwiftUI
import Combine
import UIKit
import Commons

final class LaunchNavigationController: NiblessViewController {
    
    // MARK: - Properties
    
    private let viewModel: LaunchViewModel
    private let lunchRootView: LaunchRootView
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    init(
        viewModel: LaunchViewModel,
        lunchRootView: LaunchRootView) {
            self.viewModel = viewModel
            self.lunchRootView = lunchRootView
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
    
    private func subscribe(to publisher: AnyPublisher<LaunchView, Never>) {
        publisher
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.present($0)
            }
            .store(in: &cancellable)
    }
    
    private func present(_ view: LaunchView) {
        switch view {
        case .root:
            presetLaunchRootView()
        }
    }
    
    private func presetLaunchRootView() {
        let vc = UIHostingController(rootView: self.lunchRootView)
            .with { $0.modalPresentationStyle = .overFullScreen }
        self.addFullScreen(childViewController: vc, animation: false)
    }
    
}
