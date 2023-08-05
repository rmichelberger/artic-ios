//
//  ArtDetailViewModel.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import Foundation
import Inject

final class ArtDetailViewModel: ViewModel {
    @Inject(\.useCase) private var useCase: UseCase
    
    @Published private(set) var viewState = ViewState<ArtDetailViewData, String>.initial
    
    @MainActor
    func loadArtDetail(id: Int) async {
        viewState = .loading
        do {
            let artDetail = try await useCase.getArtDetail(id: id)
            viewState = .success(artDetail)
        } catch {
            viewState = .failure(error.localizedDescription)
        }
    }
}
