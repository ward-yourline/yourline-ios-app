//
//  VStack+Extensions.swift
//  Presentation
//
//  Created by Warrd Adlani on 03/06/2023.
//

import Foundation
import SwiftUI

public extension View {
    func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat = 10) -> some View where S : ShapeStyle {
            return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
    
    func addPadding(for horizontal: CGFloat = 10, vertical: CGFloat = 10) -> some View {
        return
            padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
}
