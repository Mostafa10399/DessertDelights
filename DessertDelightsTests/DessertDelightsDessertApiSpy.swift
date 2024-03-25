//
//  DessertDelightsDessertApiSpy.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation
import DessertDelights

final class DessertDelightsDessertApiSpy: DessertApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getAllDesserts() async throws -> Meals {
         try await request(DessertService.getDesserts)
    }
    
    func getDessertDetails(by id: String) async throws -> MealDetails {
        try await request(DessertService.getDessertDetails(id: id))
    }
    
}


 extension RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T {
        var fileName = ""
        if service.requestConfiguration.path.contains("filter.php") {
            fileName = "DessertsList"
            
        }
        if let task = Bundle.unitTestForDessertDelightsDessertApi.url(forResource: fileName, withExtension: "json") {
            do {
            let data = try Data(contentsOf: task)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw error
        }
        } else {
            throw ErrorMessage(title: "", message: "")
        }
    }
}
