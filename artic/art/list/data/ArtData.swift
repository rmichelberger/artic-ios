//
//  ArtData.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

struct ArtData: Decodable {
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
