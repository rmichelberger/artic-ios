//
//  Repository.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

protocol Repository {
    func getArtList() async throws -> [Art]
    func getArtDetail(id: Int) async throws -> ArtDetail
}
