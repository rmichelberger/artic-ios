//
//  RepositoryImpl.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation

final class RepositoryImpl: Repository {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getArtList() async throws -> [Art] {
        let queryItems = [
            URLQueryItem(name: "fields", value: "id,title,image_id,date_display,artist_title,place_of_origin,medium_display,publication_history"),
            URLQueryItem(name: "limit", value: "100")]
        let response: ApiResponse<[Art]> = try await apiService.get(path: "/api/v1/artworks", queryItems: queryItems)
        return response.data.filter({ $0.publicationHistory != nil })
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetail {
        let queryItems = [
            URLQueryItem(name: "fields", value: "id,title,image_id,date_display,place_of_origin,medium_display,publication_history,artist_display,style_title")]
        let response: ApiResponse<ArtDetail> = try await apiService.get(path: "/api/v1/artworks/\(id)", queryItems: queryItems)
        return response.data
    }
}
