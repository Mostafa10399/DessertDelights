//
//  DessertDelightsService.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

protocol DessertDelightsService: RemoteService {
    var mainRoute: String { get }
}

extension DessertDelightsService {
    public var baseUrl: String {
        return "https://themealdb.com"
    }
}
