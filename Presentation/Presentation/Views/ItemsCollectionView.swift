//
//  ItemsCollectionView.swift
//  Presentation
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Resources

public struct CollectionItem {
    public let id: String
    public let imageURL: String
    public let title: String
    public let subTitle: String
    
    public init(id: String, imageURL: String, title: String, subTitle: String) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.subTitle = subTitle
    }
}
public struct ItemsCollectionView: View {
    
    let items: [CollectionItem]
    
    public init(items: [CollectionItem]) {
        self.items = items
    }
    
    public var body: some View {
        let gridItems = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
        
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(items, id: \.id) { item in
                    VStack(spacing: 8) {
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
                        .frame(height: 100) // Adjust the height as needed

                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.headline)
                                .frame(height: 40)
                            
                            Text(item.subTitle)
                                .font(.subheadline)
                                .frame(height: 40)
                            
                            Text("£100")
                                .font(.callout)
                                .frame(height: 20)
                        }
                        WideButton(buttonTitle: "Buy") {
                            // TODO
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                }
            }
            .padding(10)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsCollectionView(items: [
            .init(id: "1", imageURL: "image1", title: "Mock Title", subTitle: "Mock subtitle"),
            .init(id: "2", imageURL: "image2", title: "Mock Title", subTitle: "Mock subtitle"),
            .init(id: "3", imageURL: "image3", title: "Mock Title", subTitle: "Mock subtitle"),
            .init(id: "4", imageURL: "image4", title: "Mock Title", subTitle: "Mock subtitle"),
            .init(id: "5", imageURL: "image5", title: "Mock Title", subTitle: "Mock subtitle"),
            .init(id: "6", imageURL: "image6", title: "Mock Title", subTitle: "Mock subtitle")
        ])
    }
}
