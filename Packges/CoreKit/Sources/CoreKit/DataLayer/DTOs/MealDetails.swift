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
        meals.toModel()
    }
}
private extension Array where Element == [String: String?] {
    func toModel() -> DessertDetails {
        guard self.count > 0 else {return DessertDetails(desert: [:]) }
        return DessertDetails(desert: self.first!)
    }
}
