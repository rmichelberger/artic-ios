//
//  articApp.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI

@main
struct articApp: App {
    @State private var path = [Screen]()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                ArtListView() { id in
                    path.append(.artDetail(id))
                }
                .navigationDestination(for: Screen.self) { screen in
                    if case let .artDetail(id) = screen {
                        ArtDetailView(id: id)
                    }
                }
            }
        }
    }
}
