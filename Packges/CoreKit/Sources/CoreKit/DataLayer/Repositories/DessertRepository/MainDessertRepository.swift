//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public final class MainDessertRepository: DessertRepository {
    
    // MARK: - Properties
    
    private let remoteApi: DessertApis
    
    // MARK: - Methods
    
    public init(remoteApi: DessertApis) {
        self.remoteApi = remoteApi
    }
    
    public func getAllDesserts() async throws -> [Dessert] {
        try await remoteApi
            .getAllDesserts()
            .meals
            .map{ $0.dessert }
    }
    
    public func getDessertDetails(by id: String) async throws -> DessertDetails {
        try await remoteApi
            .getDessertDetails(by: id)
            .details
    }
}
