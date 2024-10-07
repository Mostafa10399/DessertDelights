//
//  SpyDessertService.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation
import protocol NetworkLayer.RemoteService
import struct NetworkLayer.RequestConfiguration
import struct NetworkLayer.UrlEncoding

enum SpyDessertService {
    case getDesserts
    case getDessertDetails(id: String)
    case invalidData
}

extension SpyDessertService: RemoteService {
    var baseUrl: String {
        switch self {
        case .getDesserts:
            return "DessertsList"
        case .getDessertDetails(_):
            return "DessertDetails"
        case .invalidData:
            return "invalidData"
        }
    }
    
    var requestConfiguration: RequestConfiguration {
        switch self {
        case .getDesserts, .invalidData:
            return RequestConfiguration(path: "")
        case let .getDessertDetails(id):
            return RequestConfiguration(
                path: "",
                parameters: ["i": id],
                encoding: UrlEncoding.queryString)
        }
    }
}
