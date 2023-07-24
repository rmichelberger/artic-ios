//
//  ArtDetailViewModel.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation

final class ArtDetailViewModel: ObservableObject {
    
    @Injected(\.artRepository) private var artRepository: ArtRepository       
    @Published private(set) var viewState = ViewState<ArtDetail, String>.initial
        
    @MainActor
    func loadArtDetail(id: Int) async {
        viewState = .loading
        do {
            let artDetail = try await artRepository.getArtDetail(id: id)
            viewState = .success(artDetail)
        } catch {
            viewState = .failure(error.localizedDescription)
        }
    }
}

