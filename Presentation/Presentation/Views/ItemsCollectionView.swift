//
//  ItemsCollectionView.swift
//  Presentation
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Resources
import Domain

public protocol ItemsCollectionViewDelegate {
    func didTapItem(with id: String, at index: Int)
}

public struct ItemsCollectionView: View {
    
    // Private properties
    private let items: [Item]
    private var delegate: ItemsCollectionViewDelegate?
    
    public init(items: [Item], delegate: ItemsCollectionViewDelegate?) {
        self.items = items
        self.delegate = delegate
    }
    
    public var body: some View {
        let gridItems = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
        
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(items.indices, id: \.self) { index in
                    Button(action: {
                        // Handle tap action here
                        print("Tapped item at index: \(index)")
                        let id = items[index].id
                        delegate?.didTapItem(with: id, at: index)
                    }) {
                        VStack(spacing: 8) {
                            AsyncImage(url: URL(string: items[index].imageURL)) { phase in
                                switch phase {
                                case .empty:
                                    Image("product_placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .success(let image):
                                    image
                                        .resizable()
                                case .failure:
                                    Image(systemName: "product_placeholder")
                                        .resizable()
                                        .foregroundColor(.red)
                                @unknown default:
                                    fatalError("Unhandled AsyncImage phase")
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100) // Adjust the fixed height here
                            .clipped()

                            VStack(spacing: 10) {
                                Text(items[index].title)
                                    .font(.headline)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(height: 60)
                                
                                Text(items[index].description)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(height: 40)
                                
                                Text("£100")
                                    .font(.callout)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(height: 20)
                                    .padding(.bottom, 10)
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            
                            WideButton(buttonTitle: "Add to cart") {
                                // TODO
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsCollectionView(items: [
            .init(id: "1", imageURL: "image1", title: "Mock Title", description: "Mock subtitle", price: "£100.00"),
            .init(id: "2", imageURL: "image2", title: "Mock Title", description: "Mock subtitle", price: "£100.00"),
            .init(id: "3", imageURL: "image3", title: "Mock Title", description: "Mock subtitle", price: "£100.00"),
            .init(id: "4", imageURL: "image4", title: "Mock Title", description: "Mock subtitle", price: "£100.00"),
            .init(id: "5", imageURL: "image5", title: "Mock Title", description: "Mock subtitle", price: "£100.00"),
            .init(id: "6", imageURL: "image6", title: "Mock Title", description: "Mock subtitle", price: "£100.00")
        ], delegate: nil)
    }
}
