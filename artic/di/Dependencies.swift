//
//  Dependencies.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

private struct RepositoryProviderKey: InjectionKey {
    static var currentValue: Repository = RepositoryImpl(apiService: ApiService())
}

extension InjectedValues {
    var repository: Repository {
        get { Self[RepositoryProviderKey.self] }
        set { Self[RepositoryProviderKey.self] = newValue }
    }
}

extension InjectedValues {
    static func set(repository: Repository) {
        RepositoryProviderKey.currentValue = repository
    }
}
