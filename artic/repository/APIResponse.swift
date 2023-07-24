//
//  APIResponse.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

struct APIResponse<T: Decodable>: Decodable {
    let data: T
}
