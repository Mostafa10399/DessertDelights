//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

internal final class DessertDelightsDessertApis: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
   public func getAllDesserts() async throws -> Meals {
         try await request(DessertService.getDesserts)
    }
    
    public func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(DessertService.getDessertDetails(id: id))
    }
    
}

