//
//  DessertDelightsDessertApiFailSpy.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import Foundation
import DessertDelights

final class DessertDelightsDessertApiFailSpy: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getAllDesserts() async throws -> Meals {
         try await request(SpyDessertFailService.getDesserts)
    }
    
    func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(SpyDessertFailService.getDessertDetails(id: id))
    }
    
}


