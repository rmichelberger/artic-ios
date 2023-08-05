//
//  ArtViewData.swift
//  artic
//
//  Created by roland.michelberger on 02.08.23.
//

import Foundation

struct ArtViewData: Identifiable {
    let id: Int
    let title: String
    let date: String
    let place: String
    let medium: String
    let artistName: String
    let imageURL: URL?
}
