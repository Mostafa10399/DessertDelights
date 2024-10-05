//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

struct DessertPresentable {
    let id: String
    let dessertImage: URL?
    let dessertName: String
    
    init(meal: Meal) {
        self.id = meal.id
        self.dessertImage = URL(string: meal.mealImage)
        self.dessertName = meal.mealName
    }
}
