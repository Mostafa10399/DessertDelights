//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public final class DessertDelightsDessertApis: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    public init() {}
    
   public func getAllDesserts() async throws -> Meals {
         try await request(DessertService.getDesserts)
    }
    
    public func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(DessertService.getDessertDetails(id: id))
    }
    
}

