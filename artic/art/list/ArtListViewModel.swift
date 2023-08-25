//
//  ArtListViewModel.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation
import Inject

final class ArtListViewModel: ObservableObject {
    @Inject private var useCase: UseCase

    @Published private(set) var viewState = ViewState<[ArtViewData], String>.initial
    
    init() {
        loadArtList()
    }
    
    private func loadArtList() {
        viewState = .loading
        Task { @MainActor in
            do {
                let artListModels = try await useCase.getArtList()
                viewState = .success(artListModels)
            } catch {
                viewState = .failure(error.localizedDescription)
            }
        }
    }
}
