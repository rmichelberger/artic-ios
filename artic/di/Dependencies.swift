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

    static func provideSingleton() {
        @Provides var repo: Repository = RepositoryImpl()
    }

    var retroSwift: RetroSwift {
        let logger = SimpleLogger()
        let client = OkHttpClient(logger: logger)
        return RetroSwift(client: client)
    }
    
    var apiService: ApiService { ApiService() }
    var useCase: UseCase { UseCase() }
}

