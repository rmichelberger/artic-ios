//
//  RepositoryImpl.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

final class RepositoryImpl: Repository {
    private let apiService: ApiService

    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getArtList() async throws -> [Art] {
        let response: ApiResponse<[Art]> = try await apiService.getArtList()
        return response.data.filter({ $0.publicationHistory != nil })
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetail {
        let response: ApiResponse<ArtDetail> = try await apiService.getArtDetail(id: id)
        return response.data
    }
}
