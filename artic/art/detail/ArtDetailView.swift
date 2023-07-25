//
//  ArtDetailView.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI

struct ArtDetailView: View {
    
    let id: Int
    @StateObject var viewModel: ArtDetailViewModel
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .initial, .loading: ProgressView()
            case .failure(let error): Text(error)
            case .success(let artDetail):
                ScrollView {
                    AsyncImageView(url: artDetail.imageURL, mode: .fit).frame(minHeight: 100)
                    Text(artDetail.artistDisplay).padding(.horizontal)
                    if let history = artDetail.publicationHistory {
                        HStack {
                            Image(systemName: "text.bubble")
                            Text("History").font(.title2)
                        }.padding(.init(top: 12, leading: 0, bottom: 8, trailing: 0))
                        Text(history).padding(.horizontal)
                    }
                }
                .navigationTitle(artDetail.title)
            }
        }.task {
            await viewModel.loadArtDetail(id: id)
        }
    }
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InjectedValues.set(repository: MockRepositoryImpl())
        return ArtDetailView(id: 1, viewModel: ArtDetailViewModel())
    }
}
