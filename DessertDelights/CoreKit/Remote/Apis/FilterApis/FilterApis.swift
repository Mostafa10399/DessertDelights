//
//  FilterApis.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

protocol FilterApis: RemoteAPI {
    func getAllDesserts() async throws -> Meals
}
