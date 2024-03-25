//
//  GetAllDessertsUseCase.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

protocol GetAllDessertsUseCase: AnyObject {
    var dessertRepository: DessertRepository { get }
    func getAllDesserts() async throws -> [DessertPresentable]
}

extension GetAllDessertsUseCase {
    
    func getAllDesserts() async throws -> [DessertPresentable] {
        let meals = try await dessertRepository.getAllDesserts()
        return meals.meals.map { DessertPresentable(meal: $0) }.sorted { $0.dessertName.lowercased() < $1.dessertName.lowercased() }
    }
}
