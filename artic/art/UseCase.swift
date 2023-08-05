//
//  UseCase.swift
//  artic
//
//  Created by roland.michelberger on 02.08.23.
//

import Foundation
import Inject

final class UseCase {
    @Singleton private var repository: Repository
        
    func getArtList() async throws -> [ArtViewData] {
        try await repository.getArtList().filter { $0.publicationHistory != nil }.map { convert(artData: $0) }
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetailViewData {
        convert(artDetailData: try await repository.getArtDetail(id: id))
    }
    
    private func convert(artData: ArtData) -> ArtViewData {
        ArtViewData(
            id: artData.id,
            title: artData.title ?? "Unknown art",
            date: artData.dateDisplay ?? "Unknown date",
            place: artData.placeOfOrigin ?? "Unknown place",
            medium: artData.mediumDisplay ?? "Unknown medium",
            artistName: artData.artistTitle ?? "Unknown artist",
            imageURL: artData.imageId.flatMap { URL(string: "https://www.artic.edu/iiif/2/\($0)/full/400,/0/default.jpg") })
    }
    
    private func convert(artDetailData: ArtDetailData) -> ArtDetailViewData {
        ArtDetailViewData(
            id: artDetailData.id,
            title: artDetailData.title ?? "Unknown art",
            artistName: artDetailData.artistDisplay ?? "Unknown artist",
            history: artDetailData.publicationHistory ?? "Unknown history",
            style: artDetailData.styleTitle ?? "Unknown style",
            imageURL: artDetailData.imageId.flatMap { URL(string: "https://www.artic.edu/iiif/2/\($0)/full/873,/0/default.jpg") })
    }
}
