//
//  ArtDetailView.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI
import Inject

struct ArtDetailView: View {
    
    let id: Int
    
    @StateObject private var viewModel: ArtDetailViewModel = ViewModel()

    var body: some View {
        Group {
            switch viewModel.viewState {
            case .initial, .loading: ProgressView()
            case .failure(let error): Text(error)
            case .success(let artDetail):
                ScrollView {
                    AsyncImageView(url: artDetail.imageURL, mode: .fit) {
                        ProgressView().tint(Color.primary).colorInvert()
                    }.frame(maxWidth: .infinity, minHeight: 100)
                        .background(.primary)
                    Text(artDetail.artistName).padding(.horizontal).italic().foregroundColor(.secondary)
                    Text(artDetail.style).padding(.horizontal).padding(.vertical, 8).bold()
                    HStack {
                        Image(systemName: "list.bullet").bold()
                        Text("History").font(.title2).bold()
                        Spacer()
                    }.padding(.horizontal).padding(.top).padding(.bottom, 8)
                    Text(artDetail.history).padding(.horizontal)
                }.navigationTitle(artDetail.title)
            }
        }.task {
            await viewModel.loadArtDetail(id: id)
        }
    }
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        @Singleton var repository: Repository = MockRepository()
        return ForEach(ColorScheme.allCases, id: \.self) {
            NavigationView {
                ArtDetailView(id: 1)
            }.preferredColorScheme($0)
        }
    }
}
