//
//  DessertService.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation
import Alamofire

enum DessertService {
    case getDesserts
    case getDessertDetails(id: String)
}

extension DessertService: DessertDelightsService {

    var mainRoute: String { return "/api/json/v1/1/" }
    
    var requestConfiguration: RequestConfiguration {
        switch self {
        case .getDesserts:
            let parameters = ["c": "Dessert"]
            return RequestConfiguration(
                path: mainRoute.appending("filter.php"),
                parameters: parameters,
                encoding: URLEncoding.queryString)
        case let .getDessertDetails(id):
            let parameters = ["i": id]
            return RequestConfiguration(
                path: mainRoute.appending("lookup.php"),
                parameters: parameters,
                encoding: URLEncoding.queryString)
        }
    }
}
