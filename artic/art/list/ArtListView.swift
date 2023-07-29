//
//  ArtListView.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI
import Inject

struct ArtListView: View {
    @ObservedObject private var viewModel: ArtListViewModel = Inject.viewModel()

    let navigateToDetail: (Int) -> Void
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .initial, .loading: ProgressView()
            case .failure(let error): Text(error).padding()
            case .success(let arts):
                List(arts) { art in
                    ArtRow(art: art, navigateToDetail: navigateToDetail)
                }
            }
        }.navigationTitle("ArtIC")
    }
}

struct ArtRow: View {
    let art: Art
    let navigateToDetail: (Int) -> Void
    
    var body: some View {
        Button {
            navigateToDetail(art.id)
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImageView(url: art.imageURL, mode: .fill) {
                        ProgressView().tint(Color.primary).colorInvert()
                    }
                    .frame(width: 120, height: 120)
                    .background(.primary)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.primary, lineWidth: 4))
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text(art.artistTitle)
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text(art.dateDisplay)
                        }
                        HStack {
                            Image(systemName: "mappin")
                            Text(art.placeOfOrigin)
                        }
                    }
                }
                Text(art.title).font(.title)
                Text(art.mediumDisplay).italic().foregroundColor(.secondary)
            }
        }.buttonStyle(.plain)
    }
}

struct ArtListView_Previews: PreviewProvider {
    static var previews: some View {
        Dependencies.currentRepository = MockRepository()
        return ForEach(ColorScheme.allCases, id: \.self) {
            NavigationView {
                ArtListView() { _ in }
            }.preferredColorScheme($0)
        }
    }
}
