//
//  DessertApis.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

public protocol DessertApis: RemoteAPI {
    func getAllDesserts() async throws -> Meals
    func getDessertDetails(by id: String) async throws -> MealDetails
}
