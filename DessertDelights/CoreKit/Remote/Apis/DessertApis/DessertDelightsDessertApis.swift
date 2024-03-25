//
//  DessertDelightsFilterApis.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class DessertDelightsDessertApis: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getAllDesserts() async throws -> Meals {
         try await request(DessertService.getDesserts)
    }
    
    func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(DessertService.getDessertDetails(id: id))
    }
    
}
