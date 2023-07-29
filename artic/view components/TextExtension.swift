//
//  TextExtension.swift
//  artic
//
//  Created by roland.michelberger on 27.07.23.
//

import SwiftUI

extension Text {
    init(_ text: String?, defaultText: String = "") {
        self.init(verbatim: text ?? defaultText)
    }
}
