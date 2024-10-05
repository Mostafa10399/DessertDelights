//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 04/10/2024.
//

import Foundation
import protocol NetworkLayer.RemoteService

 protocol DessertDelightsService: RemoteService {
    var mainRoute: String { get }
}

 extension DessertDelightsService {
    var baseUrl: String {
        return "https://themealdb.com"
    }
}
