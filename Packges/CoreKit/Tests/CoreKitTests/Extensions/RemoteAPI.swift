//
//  File.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation
import protocol NetworkLayer.RemoteAPI
import protocol NetworkLayer.RemoteService
import enum NetworkLayer.APIError

extension RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T {
        let fileName = service.baseUrl
        guard let json = Bundle.module.url(forResource: "\(fileName)", withExtension: "json") else {
            throw APIError.serverError(statusCode: 500)
              }
        do {
            let data = try Data(contentsOf: json)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw APIError.decodingError
        }
    }
}

