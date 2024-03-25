//
//  MainFileRepository.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class MainDessertRepository: DessertRepository {

    // MARK: - Properties
    
    private let remoteApi: DessertApis
    
    // MARK: - Methods
    
    init(remoteApi: DessertApis) {
        self.remoteApi = remoteApi
    }
    
    func getAllDesserts() async throws -> Meals {
        try await remoteApi.getAllDesserts()
    }
    
    func getDessertDetails(by id: String) async throws -> MealDetails {
        try await remoteApi.getDessertDetails(by: id)
    }
}
