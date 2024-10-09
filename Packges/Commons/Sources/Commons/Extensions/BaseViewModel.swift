//
//  BaseViewModel.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation
import enum NetworkLayer.APIError

public protocol BaseViewModel: AnyObject, ObservableObject {
    var isDataLoading: Bool { set get }
    var errorMessage: APIError? { set get }
    func setIsDataLoading(_ value: Bool)
    func setErrorMessage(_ value: APIError?)
}

extension BaseViewModel {
    
    @MainActor
    public func setIsDataLoading(_ value: Bool) {
        self.isDataLoading = value
        
    }
    
    @MainActor
    public func setErrorMessage(_ value: APIError?) {
        self.errorMessage = value
    }
}
