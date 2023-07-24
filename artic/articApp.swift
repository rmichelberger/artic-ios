//
//  articApp.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI

@main
struct articApp: App {
    
    init() {
//        InjectedValues.set(artRepository: MockArtRepositoryImpl())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ArtListView(viewModel: ArtListViewModel())
            }
        }
    }
}
