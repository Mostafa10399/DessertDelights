//
//  Meal.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

struct Meal: Codable {
    let id: String
    let mealName: String
    let mealImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case mealName = "strMeal"
        case mealImage = "strMealThumb"
    }
}
