//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public protocol GetAllDessertsUseCase: AnyObject {
    var dessertRepository: DessertRepository { get }
    func getAllDesserts() async throws -> [DessertPresentable]
}

extension GetAllDessertsUseCase {
    
    public func getAllDesserts() async throws -> [DessertPresentable] {
        let desserts = try await dessertRepository.getAllDesserts()
        return desserts
            .convertToDessertPresentable()
            .sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
}
