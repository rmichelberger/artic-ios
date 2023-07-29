//
//  Art.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation

struct Art: Decodable, Identifiable {
    let id: Int
    let title: String?
    let dateDisplay: String?
    let placeOfOrigin: String?
    let mediumDisplay: String?
    let artistTitle: String?
    let imageId: String?
    let publicationHistory: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case dateDisplay = "date_display"
        case placeOfOrigin = "place_of_origin"
        case mediumDisplay = "medium_display"
        case artistTitle = "artist_title"
        case imageId = "image_id"
        case publicationHistory = "publication_history"
    }
}

extension Art {
    var imageURL: URL? {
        guard let imageId else { return nil }
        return URL(string: "https://www.artic.edu/iiif/2/\(imageId)/full/400,/0/default.jpg")
    }
}
