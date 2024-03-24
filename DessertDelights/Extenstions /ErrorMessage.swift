//
//  ErrorMessage.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import Foundation

public struct ErrorMessage: Error {
    
    // MARK: - Properties
    public let id: UUID
    public let title: String
    public var message: String
    public let errorCode: Int?
    public let errorImage: String?
    
    // MARK: - Methods
    public init(title: String, message: String, errorCode: Int? = nil, errorImage: String? = nil) {
        self.id = UUID()
        self.title = title
        self.message = message
        self.errorCode = errorCode
        self.errorImage = errorImage
    }
    
    public init(error: Error) {
        self.id = UUID()
        self.title = ""
        self.message = error.localizedDescription
        self.errorCode = nil
        self.errorImage = nil
    }
}

extension ErrorMessage: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}

extension ErrorMessage: Equatable {
    
    public static func == (lhs: ErrorMessage, rhs: ErrorMessage) -> Bool {
        return lhs.id == rhs.id
    }
}
