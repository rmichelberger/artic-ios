//
//  ApiService.swift
//  artic
//
//  Created by roland.michelberger on 25.07.23.
//

import Foundation
import Inject
import RetroSwift

final class ApiService {
    @Inject private var retroSwift: RetroSwift

    private let baseUrl = "https://api.artic.edu"
    
    func getArtList() async throws -> ApiResponse<[ArtData]> {
        @Path(path: "/api/v1/artworks") var path
        @Query(name: "fields") var fields = "id,title,image_id,date_display,artist_title,place_of_origin,medium_display,publication_history"
        @Query(name: "limit") var limit = 100
        @GET(baseURL: baseUrl, path: path, queries: [fields, limit]) var request
        return try await retroSwift.execute(request: request)
    }

    func getArtDetail(id: Int) async throws -> ApiResponse<ArtDetailData> {
        @Path(path: "/api/v1/artworks/{id}", name: "id") var path = id
        @Query(name: "fields") var fields = "id,title,image_id,publication_history,artist_display,style_title"
        @GET(baseURL: baseUrl, path: path, queries: [fields]) var request
        return try await retroSwift.execute(request: request)
    }
}
