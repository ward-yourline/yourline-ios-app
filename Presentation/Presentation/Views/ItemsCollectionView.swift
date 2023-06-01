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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
            ForEach(items, id: \.id) { item in
                VStack(spacing: 8) {
                    Image("product_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 128)

                    VStack(alignment: .leading, spacing: 10) {
                        Text(item.title)
                            .font(.headline)
                        
                        Text(item.subTitle)
                            .font(.subheadline)
                        
                        Text("£100")
                            .font(.callout)
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
