//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation
import protocol NetworkLayer.RemoteAPI

public protocol DessertApis: RemoteAPI {
    func getAllDesserts() async throws -> Meals
    func getDessertDetails(by id: String) async throws -> MealDetails
}
