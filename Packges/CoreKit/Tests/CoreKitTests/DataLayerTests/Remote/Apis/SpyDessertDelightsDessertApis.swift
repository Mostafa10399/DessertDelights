//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 07/10/2024.
//

import Foundation
import struct CoreKit.Meals
import struct CoreKit.Meal
import struct CoreKit.MealDetails
import protocol CoreKit.DessertApis

internal class SpyDessertDelightsDessertApis: DessertApis {
    
    // MARK: - Parameters
    
    private let shouldSimulateFailure: Bool
    
    // MARK: - Methods
    
    init(shouldSimulateFailure: Bool = false) {
        self.shouldSimulateFailure = shouldSimulateFailure
    }
    
    func getAllDesserts() async throws -> CoreKit.Meals {
        if shouldSimulateFailure {
            return try await request(SpyDessertService.invalidData)
        }
        return try await request(SpyDessertService.getDesserts)
    }
    
    func getDessertDetails(by id: String) async throws -> CoreKit.MealDetails {
        if shouldSimulateFailure {
            return try await request(SpyDessertService.invalidData)
        }
        return try await request(SpyDessertService.getDessertDetails(id: id))
    }
    
    
}
