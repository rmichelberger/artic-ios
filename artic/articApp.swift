//
//  articApp.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

import SwiftUI
import Inject

@main
struct articApp: App {
    @State private var path = [Screen]()
    
    init() {
        Dependencies()
        @Singleton var repo: Repository = MockRepository()
    }
    
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
