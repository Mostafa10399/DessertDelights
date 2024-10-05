//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 04/10/2024.
//

import Foundation
import struct NetworkLayer.RequestConfiguration
import struct NetworkLayer.UrlEncoding

enum DessertService {
    case getDesserts
    case getDessertDetails(id: String)
}

extension DessertService: DessertDelightsService {
    
    var mainRoute: String { return "/api/json/v1/1/" }
    
    public var requestConfiguration: RequestConfiguration {
        switch self {
        case .getDesserts:
            let parameters = ["c": "Dessert"]
            return RequestConfiguration(
                path: mainRoute.appending("filter.php"),
                parameters: parameters,
                encoding: UrlEncoding.queryString)
        case let .getDessertDetails(id):
            let parameters = ["i": id]
            return RequestConfiguration(
                path: mainRoute.appending("lookup.php"),
                parameters: parameters,
                encoding: UrlEncoding.queryString)
        }
    }
}
