//
//  ArtListView.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI

struct ArtListView: View {
    
    @ObservedObject var viewModel: ArtListViewModel

    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .initial, .loading: ProgressView()
            case .failure(let error): Text(error)
            case .success(let arts):
                List(arts) { art in
                    NavigationLink {
                        ArtDetailView(id: art.id, viewModel: ArtDetailViewModel())
                    } label: {
                        ArtRow(art: art)
                    }
                }
            }
        }.task {
            if case .initial = viewModel.viewState {
                await viewModel.loadArtList()
            }
        }.navigationTitle("ArtIC")
    }
}

struct ArtRow: View {
    let art: Art
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImageView(url: art.imageURL)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text(art.artistTitle ?? "Unknown")
                    }
                    HStack {
                        Image(systemName: "calendar")
                        Text(art.dateDisplay)
                    }
                    if let placeOfOrigin = art.placeOfOrigin {
                        HStack {
                            Image(systemName: "mappin")
                            Text(placeOfOrigin)
                        }
                    }
                }
            }
            Text(art.title).font(.title)
            Text(art.mediumDisplay ?? "")
        }
    }
}

struct ArtListView_Previews: PreviewProvider {
    static var previews: some View {
        InjectedValues.set(artRepository: MockArtRepositoryImpl())
        return NavigationView {ArtListView(viewModel: ArtListViewModel()) }
    }
}
