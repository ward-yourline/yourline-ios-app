//
//  WideButton.swift
//  Presentation
//
//  Created by Warrd Adlani on 31/05/2023.
//

import SwiftUI
import Resources

public struct WideButton: View {
    private let buttonTitle: String
    private var onTap: () -> Void
    private let font: Fonts
    private let backgroundColor: Color
    private let forgroundColor: Color
    
    public init(buttonTitle: String, forgroundColor: Color = .white, backgroundColor: Color = .darkSlateGray, font: Fonts = .bold, onTap: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.onTap = onTap
        self.font = font
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
    }

    public var body: some View {
        VStack(spacing: 10) {
            Button(action: onTap) {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(forgroundColor)
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .font(font.swiftUIFont())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 0)
    }
}

struct WideButton_Previews: PreviewProvider {
    static var previews: some View {
        WideButton(buttonTitle: "Test") {
            // Leave empty
        }
    }
}
