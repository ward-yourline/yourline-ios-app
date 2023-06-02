//
//  ItemDetailView.swift
//  Presentation
//
//  Created by Warrd Adlani on 02/06/2023.
//

import SwiftUI
import Domain

public struct ItemDetailView: View {
    
    private let item: CollectionItem
    
    public init(item: CollectionItem) {
        self.item = item
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                
                AsyncImage(url: URL(string: item.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        Image("product_placeholder")
                            .resizable()
                    case .success(let image):
                        image
                            .resizable()
                    case .failure:
                        Image(systemName: "exclamationmark.circle")
                            .resizable()
                            .foregroundColor(.red)
                    @unknown default:
                        fatalError("Unhandled AsyncImage phase")
                    }
                }
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(item.subTitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            WideButton(buttonTitle: "Buy") {
                // TODO
            }
            .padding(.bottom, 10)
        }
        .padding()
    }
}
