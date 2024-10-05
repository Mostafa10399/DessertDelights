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
    
    func getAllDesserts() async throws -> [DessertPresentable] {
        let meals = try await dessertRepository.getAllDesserts()
        return meals.meals.map { DessertPresentable(meal: $0) }.sorted { $0.dessertName.lowercased() < $1.dessertName.lowercased() }
    }
}
