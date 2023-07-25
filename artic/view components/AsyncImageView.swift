//
//  AsyncImageView.swift
//  artic
//
//  Created by roland.michelberger on 24.07.23.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let mode: Mode
    enum Mode {
        case fill
        case fit
    }
    
    var body: some View {
        AsyncImage(url: url) { image in
            switch mode {
            case .fill:
                image.resizable().scaledToFill()
            case .fit:
                image.resizable().scaledToFit()
            }
        } placeholder: {
            ZStack {
                Color.primary
                ProgressView().tint(Color.primary).colorInvert()
            }
        }
    }
}
