//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public protocol GetDessertDetailsUseCase: AnyObject {
    var dessertRepository: DessertRepository { get }
    func getDessertDetails(by id: String) async throws -> DessertDetailsPresentable
}

extension GetDessertDetailsUseCase {
    public func getDessertDetails(by id: String) async throws -> DessertDetailsPresentable {
        let details = try await dessertRepository.getDessertDetails(by: id)
        return DessertDetailsPresentable(dessert: details.desert)
    }
}
