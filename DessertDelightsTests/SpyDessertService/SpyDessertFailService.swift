//
//  SpyDessertFailService.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import Foundation
import Alamofire
import DessertDelights

enum SpyDessertFailService {
    case getDesserts
    case getDessertDetails(id: String)
}

extension SpyDessertFailService: RemoteService {
    var baseUrl: String {
        return "Mock"
    }
    
    var requestConfiguration: DessertDelights.RequestConfiguration {
        switch self {
        
        case .getDesserts:
            return RequestConfiguration(path: "")
        case let .getDessertDetails(id):
            return RequestConfiguration(
                path: "",
                parameters: ["i": id],
                encoding: URLEncoding.queryString)
        }
    }
    
    
}
