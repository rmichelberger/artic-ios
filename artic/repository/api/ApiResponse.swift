//
//  ApiResponse.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

struct ApiResponse<T: Decodable>: Decodable {
    let data: T
}
