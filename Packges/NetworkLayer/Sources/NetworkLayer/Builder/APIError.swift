//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 03/10/2024.
//

import Foundation

enum APIError: Error {
    case badRequest
    case serverError(statusCode: Int)
    case tooManyRequests(remaining: Int)
    case unAuthorized
    case decodingError(Error)
    case timeout
    case noInternetConnection
    case unknown(Error)
    case emptyDate
    
    var localizedDescription: String {
        switch self {
        case .badRequest:
            return "The request was invalid. Please check your input and try again."
        case let .serverError(statusCode):
            return "Server error with status code \(statusCode). Please try again later."
        case let .tooManyRequests(remaining):
            return "Too many requests. Please wait and try again. Remaining: \(remaining)."
        case .unAuthorized:
            return "Unauthorized access. Please check your credentials."
        case let .decodingError(error):
            return "Decoding error: \(error.localizedDescription)."
        case .timeout:
            return "The request timed out. Please try again."
        case .noInternetConnection:
            return "No internet connection. Please check your network settings."
        case let .unknown(error):
            return "An unknown error occurred: \(error.localizedDescription)."
        case .emptyDate:
            return "empty data"
        }
    }
}
