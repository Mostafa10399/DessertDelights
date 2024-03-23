//
//  FilterService.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation
import Alamofire

enum FilterService {
    case getDesserts
}

extension FilterService: DessertDelightsService {

    var mainRoute: String { return "/filter.php"}
    
    var requestConfiguration: RequestConfiguration {
        switch self {
        case .getDesserts:
            let parameters = ["c": "Dessert"]
            return RequestConfiguration(
                path: mainRoute,
                parameters: parameters,
                encoding: URLEncoding.queryString)
        }
    }
}
