//
//  DessertDelightsFilterApis.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class DessertDelightsFilterApis: FilterApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getAllDesserts() async throws -> Meals {
         try await request(FilterService.getDesserts)
    }
    
}
