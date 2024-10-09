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
        try await AF
            .request(service)
            .validate(statusCode: 200..<400)
            .serializingDecodable(T.self)
            .executed(type: T.self)
    }
}
