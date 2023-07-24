//
//  State.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

enum ViewState<Data, Error> {
    case initial
    case loading
    case failure(Error)
    case success(Data)
}
