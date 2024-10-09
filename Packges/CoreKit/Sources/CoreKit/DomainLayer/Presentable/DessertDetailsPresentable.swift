//
//  DessertDetailsPresentable.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public struct DessertDetailsPresentable {
    public let dessertName: String
    public let dessertImageUrl: URL?
    public let dessertArea: String
    public let instructions: String
    public var ingredients: [String]

    init(dessert: [String: Any]) {
        self.dessertName = dessert["strMeal"] as? String ?? ""
        if let imageUrlString = dessert["strMealThumb"] as? String {
            self.dessertImageUrl = URL(string: imageUrlString)
        } else {
            self.dessertImageUrl = nil
        }
        self.dessertArea = dessert["strArea"] as? String ?? ""
        self.instructions = dessert["strInstructions"] as? String ?? ""

        var ingredientsList: [String] = []
        
        // Dynamically find ingredients and their measures
        for (key, value) in dessert {
            if key.starts(with: "strIngredient"), let ingredient = value as? String, !ingredient.isEmpty {
                let measureKey = key.replacingOccurrences(of: "strIngredient", with: "strMeasure")
                if let measure = dessert[measureKey] as? String, !measure.isEmpty {
                    ingredientsList.append("\(ingredient): \(measure)")
                }
            }
        }
        
        self.ingredients = ingredientsList
    }
}
