//
//  ArtDetailData.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

struct ArtDetailData: Decodable {
    let id: Int
    let title: String?
    let dateDisplay: String?
    let placeOfOrigin: String?
    let mediumDisplay: String?
    let artistDisplay: String?
    let imageId: String?
    let publicationHistory: String?
    let styleTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case dateDisplay = "date_display"
        case placeOfOrigin = "place_of_origin"
        case mediumDisplay = "medium_display"
        case artistDisplay = "artist_display"
        case imageId = "image_id"
        case publicationHistory = "publication_history"
        case styleTitle = "style_title"
    }
}
