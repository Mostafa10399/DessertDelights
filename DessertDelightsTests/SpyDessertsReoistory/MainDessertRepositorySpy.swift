//
//  MainDessertRepositorySpy.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import Foundation
import DessertDelights

class MainDessertRepositorySpy: DessertRepository {
    
    // MARK: - Properties
    
    private let spy: DessertApis
    
    // MARK: - Methods
    
    init(spy: DessertApis) {
        self.spy = spy
    }
    
    func getAllDesserts() async throws -> DessertDelights.Meals {
        try await spy.getAllDesserts()
    }
    
    func getDessertDetails(by id: String) async throws -> DessertDelights.MealDetails {
        try await spy.getDessertDetails(by: id)
    }
    
    
}
