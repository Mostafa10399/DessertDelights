//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public protocol DessertRepository {
    func getAllDesserts() async throws -> [Dessert]
    func getDessertDetails(by id: String) async throws -> DessertDetails
}
