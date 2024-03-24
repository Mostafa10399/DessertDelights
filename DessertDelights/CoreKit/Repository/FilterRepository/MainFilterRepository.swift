//
//  MainFileRepository.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

final class MainFilterRepository: FilterRepository {
    
    // MARK: - Properties
    
    private let remoteApi: FilterApis
    
    // MARK: - Methods
    
    init(remoteApi: FilterApis) {
        self.remoteApi = remoteApi
    }
    
    func getAllDesserts() async throws -> Meals {
        try await remoteApi.getAllDesserts()
    }
}
