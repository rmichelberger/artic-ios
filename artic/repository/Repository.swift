//
//  Repository.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Inject

protocol Repository {
    func getArtList() async throws -> [ArtData]
    func getArtDetail(id: Int) async throws -> ArtDetailData
}
