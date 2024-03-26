//
//  SpyDessertService.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import Foundation
import Alamofire
import DessertDelights

enum SpyDessertService {
    case getDesserts
    case getDessertDetails(id: String)
}

extension SpyDessertService: RemoteService {
    var baseUrl: String {
        switch self {
        case .getDesserts:
            return "DessertsList"
        case .getDessertDetails(_):
            return "DessertDetails"
        }
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
