//
//  Meal.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

public struct Meal: Codable {
    let id: String
    let mealName: String
    let mealImage: URL?
    var dessert: Dessert {
        Dessert(
            id: id,
            name: mealName,
            imageUrl: mealImage)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case mealName = "strMeal"
        case mealImage = "strMealThumb"
    }
}
