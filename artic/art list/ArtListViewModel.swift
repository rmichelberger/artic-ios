//
//  ArtListViewModel.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation

final class ArtListViewModel: ObservableObject {
    
    @Injected(\.artRepository) private var artRepository: ArtRepository
    @Published private(set) var viewState = ViewState<[Art], String>.initial
    
    @MainActor
    func loadArtList() async {
        viewState = .loading
        do {
            let artListModels = try await artRepository.getArtList()
            viewState = .success(artListModels)
        } catch {
            viewState = .failure(error.localizedDescription)
        }
    }
}
