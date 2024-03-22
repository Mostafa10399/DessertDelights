//
//  LaunchViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

final class LaunchViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var view: LaunchView
    
    // MARK: - Methods
    
    init() {
        self.view = .root
    }
}
