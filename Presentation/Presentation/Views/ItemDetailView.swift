//
//  ItemDetailView.swift
//  Presentation
//
//  Created by Warrd Adlani on 02/06/2023.
//

import SwiftUI
import Domain
import Resources

public struct ItemDetailView: View {
    
    private let item: CollectionItem
    @State private var quantity = "1"
    
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
                .padding(.bottom, 10)
                
                Divider()
                
                HStack {
                    VStack {
                        HStack {
                            VStack {
                                Text("Quantity").padding(.horizontal, 10)
                                    .padding(.top, 5)
                                    .frame(maxWidth: .infinity ,alignment: .leading)
                                Text("1")
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 5)
                                    .frame(maxWidth: .infinity ,alignment: .leading)
                            }
                            Button {
                                //
                            } label: {
                                Image(systemName: "chevron.down")
                            }
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                        }
                    }
                    .frame(width: 140, height: 50)
                    .addBorder(CustomColors.lightGrey.color)
                    
                    WideButton(buttonTitle: "Buy") {
                        // TODO
                    }
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.price)
                        .font(.callout)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 10)
        }
        .padding()
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: CollectionItem(id: "123", imageURL: "http://localhost:8081/image/62a59176-5846-45d0-b14c-be896f5a90df", title: "Product title", description: """
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci
""", price: "£100.00"))
    }
}
