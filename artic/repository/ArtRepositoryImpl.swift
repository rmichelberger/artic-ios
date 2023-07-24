//
//  ArtRepositoryImpl.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation

struct ArtRepositoryImpl: ArtRepository {
    func getArtList() async throws -> [Art] {
        let request = URLRequest(url: URL(string: "https://api.artic.edu/api/v1/artworks?fields=id,title,image_id,date_display,artist_title,place_of_origin,medium_display,publication_history&limit=100")!)
        let data = try await URLSession.shared.data(for: request).0
        let response = try JSONDecoder().decode(APIResponse<[Art]>.self, from: data)
        return response.data.filter({ $0.publicationHistory != nil })
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetail {
        let request = URLRequest(url: URL(string: "https://api.artic.edu/api/v1/artworks/\(id)?fields=id,title,image_id,date_display,place_of_origin,medium_display,publication_history,artist_display,style_title")!)
        let data = try await URLSession.shared.data(for: request).0
        let response = try JSONDecoder().decode(APIResponse<ArtDetail>.self, from: data)
        return response.data
    }
}
