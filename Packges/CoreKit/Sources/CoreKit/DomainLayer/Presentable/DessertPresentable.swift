//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

public struct DessertPresentable {
    let id: String
    let imageUrl: URL?
    let name: String
    
    init(dessert: Dessert) {
        self.id = dessert.id
        self.imageUrl = dessert.imageUrl
        self.name = dessert.name
    }
}

extension Array where Element == Dessert {
    func convertToDessertPresentable() -> [DessertPresentable] {
        return self.map { DessertPresentable(dessert: $0) }
    }
}
