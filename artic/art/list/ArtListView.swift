//
//  ArtListView.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI
import Inject

struct ArtListView: View {
    
    let navigateToArtDetail: (Int) -> Void

    @StateObject private var viewModel: ArtListViewModel = ViewModel()

    var body: some View {
        Group {
            switch viewModel.viewState {
            case .initial, .loading: ProgressView()
            case .failure(let error): Text(error).padding()
            case .success(let arts):
                List(arts) { art in
                    ArtRow(art: art, navigateToArtDetail: navigateToArtDetail)
                }
            }
        }
        .navigationTitle("ArtIC")
        .task {
            await viewModel.loadArtList()
        }
    }
}

struct ArtRow: View {
    let art: ArtViewData
    let navigateToArtDetail: (Int) -> Void
    
    var body: some View {
        Button {
            navigateToArtDetail(art.id)
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
                            Text(art.artistName)
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text(art.date)
                        }
                        HStack {
                            Image(systemName: "mappin")
                            Text(art.place)
                        }
                    }
                }
                Text(art.title).font(.title)
                Text(art.medium).italic().foregroundColor(.secondary)
            }
        }.buttonStyle(.plain)
    }
}

struct ArtListView_Previews: PreviewProvider {
    static var previews: some View {
        @Singleton var repository: Repository = MockRepository()
        return ForEach(ColorScheme.allCases, id: \.self) {
            NavigationView {
                ArtListView() { _ in }
            }.preferredColorScheme($0)
        }
    }
}

#if targetEnvironment(simulator)
import RetroSwift
import OkHttpClient
extension OkHttpClient: HTTPClient {}
#endif
