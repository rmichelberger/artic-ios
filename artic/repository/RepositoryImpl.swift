//
//  RepositoryImpl.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Inject

final class RepositoryImpl: Repository {
    @Inject private var apiService: ApiService

    func getArtList() async throws -> [ArtData] {
        try await apiService.getArtList().data
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetailData {
        try await apiService.getArtDetail(id: id).data
    }
}
