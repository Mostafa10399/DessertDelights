//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

struct DessertDetailsPresentable {
    let dessertName: String
    let dessertImageUrl: URL?
    let dessertArea: String
    let instructions: String
    var ingredient: [String]
    
    init(dessert: [String: String?]) {
        self.dessertName = (dessert["strMeal"] ?? "") ?? ""
        if let dessertImageUrl = dessert["strMealThumb"], let urlString = dessertImageUrl {
            self.dessertImageUrl = URL(string: urlString)
        } else {
            self.dessertImageUrl = nil
        }
        self.dessertArea = (dessert["strArea"] ?? "") ?? ""
        self.instructions = (dessert["strInstructions"] ?? "") ?? ""
        var ingredient: [String] = []
        for index in 1 ... 20 {
            if let ingredientPerIndex = dessert["strIngredient\(index)"], let measurePerIndex = dessert["strMeasure\(index)"]  {
                if let ingredientPerIndex = ingredientPerIndex, let measurePerIndex = measurePerIndex, !ingredientPerIndex.isEmpty, !ingredientPerIndex.isEmpty {
                    let ingredientWithItsMeasures = "\(ingredientPerIndex) : \(measurePerIndex)"
                    ingredient.append(ingredientWithItsMeasures)
                }
            }
        }
        self.ingredient = ingredient
    }
}
