//
//  ScreenStateProtocol.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation

protocol ScreenStateProtocol: AnyObject {
    var isDataLoading: Bool { set get }
    var errorMessage: ErrorMessage? { set get }
    func setIsDataLoading(_ value: Bool)
    func setErrorMessage(_ value: ErrorMessage)
}

extension ScreenStateProtocol {
     func setIsDataLoading(_ value: Bool) {
        DispatchQueue
            .main
            .async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.isDataLoading = value
            }
    }
    
     func setErrorMessage(_ value: ErrorMessage) {
        DispatchQueue
            .main
            .async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.errorMessage = value
            }
    }
}
