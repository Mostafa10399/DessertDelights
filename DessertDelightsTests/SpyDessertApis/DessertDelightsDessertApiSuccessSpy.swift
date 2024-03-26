//
//  DessertDelightsDessertApiSpy.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation
import DessertDelights

final class DessertDelightsDessertApiSuccessSpy: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getAllDesserts() async throws -> Meals {
         try await request(SpyDessertSuccessService.getDesserts)
    }
    
    func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(SpyDessertSuccessService.getDessertDetails(id: id))
    }
    
}

 extension RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T {
        let fileName = service.baseUrl
        if let task = Bundle.unitTestForDessertDelightsDessertApiSpy.url(forResource: fileName, withExtension: "json") {
            do {
            let data = try Data(contentsOf: task)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw ErrorMessage(title: "error", message: error.localizedDescription)
        }
        } else {
            throw ErrorMessage(title: "error", message: "Not found")
        }
    }
}
