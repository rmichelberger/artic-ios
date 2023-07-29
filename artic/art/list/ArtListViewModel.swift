//
//  ArtListViewModel.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation
import Inject

final class ArtListViewModel: ViewModel {
        
    @Inject(\.repository) private var repository: Repository
    @Published private(set) var viewState = ViewState<[Art], String>.initial
    
    init() {
        loadArtList()
    }
    
    private func loadArtList() {
        viewState = .loading
        Task {
            do {
                let artListModels = try await repository.getArtList()
                await MainActor.run {
                    viewState = .success(artListModels)
                }
            } catch {
                await MainActor.run {
                    viewState = .failure(error.localizedDescription)
                }
            }
        }
    }
}
