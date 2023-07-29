//
//  Dependencies.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

import RetroSwift
import Inject
import OkHttpClient

extension Dependencies {
    var repository: Repository { Dependencies.currentRepository }
    static var currentRepository: Repository = RepositoryImpl(apiService: ApiService(retroSwift: RetroSwift(client: OkHttpClient(logger: SimpleRequestLogger()))))
}
