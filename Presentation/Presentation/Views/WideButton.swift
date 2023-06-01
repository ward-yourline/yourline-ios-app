//
//  WideButton.swift
//  Presentation
//
//  Created by Warrd Adlani on 31/05/2023.
//

import SwiftUI
import Resources

// TODO: Put in presentation layer
public struct WideButton: View {
    private let buttonTitle: String
    private var completion: () -> Void
    
    public init(buttonTitle: String, completion: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.completion = completion
    }

    public var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                completion()
            }) {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(CustomColors.darkGrey.color)
                    .cornerRadius(8)
                    .font(.custom(Fonts.bold.name, size: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 0)
    }
}

struct WideButton_Previews: PreviewProvider {
    static var previews: some View {
        WideButton(buttonTitle: "Test", completion: {
            // Nothing
        })
    }
}
