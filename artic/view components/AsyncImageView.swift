//
//  AsyncImageView.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ZStack {
                Color.primary
                ProgressView().tint(Color.primary).colorInvert()
            }
        }
    }
}
