//
//  MealDetails.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation

public struct MealDetails: Codable {
    let meals: [[String: String?]]
    public var details: DessertDetails {
        DessertDetails(desert: meals[0])
    }
}
