//
//  ItemDetailView.swift
//  Presentation
//
//  Created by Warrd Adlani on 02/06/2023.
//

import SwiftUI
import Domain
import Resources
import Utilities

public struct ItemDetailView: View {
    
    private let item: Item
    @State private var quantity = 1
    @State private var showPicker = false
    
    public init(item: Item) {
        self.item = item
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ScrollView {
                    ItemImageView(item: item)
                    
                    Divider()
                    
                    ItemPurchaseView(showPicker: showPicker, quantity: $quantity, showPickerCallBack: {
                        showPicker = true
                    })
                    ItemInfoView(item: item)
                }
                .padding(.bottom, 10)
            }
            .padding()
            .sheet(isPresented: $showPicker, content: {
                QuantityPickerView(showPicker: showPicker, quantity: $quantity, hidePickerCallBack: { selectedQuantity in
                    showPicker = false
                    if let selectedQuantity = selectedQuantity {
                        self.quantity = selectedQuantity
                    }
                })
                
                Spacer()
            })
        }
        .navigationTitle("Store")
    }
}

struct QuantityPickerView: View {
    @State private(set) var showPicker = false
    @Binding private(set) var quantity: Int
    
    private(set) var hidePickerCallBack: (_ quantity: Int? ) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    hidePickerCallBack(nil)
                } label: {
                    Image(systemName: "xmark").foregroundColor(.black)
                }
                .padding()
                .foregroundColor(.blue)
            }
            .background(Color.white)
            
            Text("Quantity").font(.title)
            Picker("Select a number", selection: $quantity) {
                ForEach(1...100, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            .padding()
            WideButton(buttonTitle: "Select") {
                hidePickerCallBack(quantity)
            }
            .padding()
        }
    }
}

struct ItemImageView: View {
    
    let item: Item
    
    var body: some View {
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
    }
}

struct ItemPurchaseView: View {
    
    @State private(set) var showPicker = false
    @Binding private(set) var quantity: Int
    
    private(set) var showPickerCallBack: () -> Void
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack(alignment: .center, spacing: 4) {
                        Text("Quantity")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity ,alignment: .leading)
                        Text("\(quantity)")
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity ,alignment: .leading)
                    }.padding(.vertical, 4)
                    Button {
                        showPickerCallBack()
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                }
            }
            .frame(width: 140)
            .addBorder(CustomColors.lightGrey.color)
            
            WideButton(buttonTitle: "Buy") {
                // TODO
            }
        }
        .padding(.vertical, 10)
    }
}

struct ItemInfoView: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(item.price)
                .font(.callout)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            Text("Description").font(.callout)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(id: "123", imageURL: "http://localhost:8081/image/62a59176-5846-45d0-b14c-be896f5a90df", title: "Product title", description: """
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci
""", price: "£100.00"))
    }
}
