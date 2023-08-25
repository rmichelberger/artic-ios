//
//  Dependencies.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

import RetroSwift
import Inject
import OkHttpClient

func Dependencies() {
    
    @Provides var apiService = { ApiService() }
    @Provides var retroSwift = {
        let logger = SimpleLogger()
        let client = OkHttpClient(logger: logger)
        return RetroSwift(client: client)
    }
    @Provides var useCase = { UseCase() }
        

    // ViewModels
    @Provides var artListViewModel = { ArtListViewModel() }
    @Provides var artDetailViewModel = { ArtDetailViewModel() }
    
    // Singletons
    @Singleton var repository: Repository = RepositoryImpl()
}
