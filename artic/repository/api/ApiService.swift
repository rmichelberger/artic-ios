//
//  ApiService.swift
//  artic
//
//  Created by roland.michelberger on 25.07.23.
//

import Foundation

final class ApiService {
    
    private let baseUrl = "https://api.artic.edu"
    
    enum ApiServiceError: Error { case malformedRequest }
    
    func get<T: Decodable>(path: String, queryItems: [URLQueryItem]?) async throws -> ApiResponse<T> {
        guard var urlComponents = URLComponents(string: baseUrl) else { throw ApiServiceError.malformedRequest }
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { throw ApiServiceError.malformedRequest }
        return try await perform(request: URLRequest(url: url))
    }

    func perform<T: Decodable>(request: URLRequest) async throws -> ApiResponse<T> {
        let data = try await URLSession.shared.data(for: request).0
        return try JSONDecoder().decode(ApiResponse<T>.self, from: data)
    }
}
