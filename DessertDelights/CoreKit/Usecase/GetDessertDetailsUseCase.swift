//
//  GetDessertDetailsUseCase.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation

protocol GetDessertDetailsUseCase: AnyObject {
    var dessertRepository: DessertRepository { get }
    func getDessertDetails(by id: String) async throws -> DessertDetailsPresentable
}

extension GetDessertDetailsUseCase {
    func getDessertDetails(by id: String) async throws -> DessertDetailsPresentable {
        let details = try await dessertRepository.getDessertDetails(by: id)
        return DessertDetailsPresentable(dessert: details.meals[0])
    }
}
