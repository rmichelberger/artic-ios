//
//  Dependencies.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

private struct ArtRepositoryProviderKey: InjectionKey {
    static var currentValue: ArtRepository = ArtRepositoryImpl()
}

extension InjectedValues {
    var artRepository: ArtRepository {
        get { Self[ArtRepositoryProviderKey.self] }
        set { Self[ArtRepositoryProviderKey.self] = newValue }
    }
}

extension InjectedValues {
    static func set(artRepository: ArtRepository) {
        ArtRepositoryProviderKey.currentValue = artRepository
    }
}
