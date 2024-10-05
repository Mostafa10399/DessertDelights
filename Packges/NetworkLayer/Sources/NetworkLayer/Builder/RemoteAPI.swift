//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 03/10/2024.
//

import Foundation
import Alamofire

public protocol RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T
}

extension RemoteAPI {
    
    public func request<T: Codable>(_ service: RemoteService) async throws -> T {
        let task = AF
            .request(service)
            .serializingDecodable(T.self)
        do {
            return try await task.value
        } catch {
            throw error
        }
    }
}
