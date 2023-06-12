//
//  ItemCartCellView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 12/06/2023.
//

import SwiftUI
import Presentation
import Resources
import Domain

public protocol ItemCartCellDelegate {
    func didTapDeleteButton(with id: String)
    func didTapCell(with id: String)
    func didTapQuantityButton(with id: String)
}

public struct ItemCartCellView: View {

    private let cartItem: CartItem
    private var delegate: ItemCartCellDelegate?
    
    init(cartItem: CartItem, delegate: ItemCartCellDelegate?) {
        self.cartItem = cartItem
        self.delegate = delegate
    }
    
    public var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    AsyncImage(url: URL(string: cartItem.item.imageURL)) { phase in
                        switch phase {
                        case .empty:
                            Image("product_placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5.0) {
                        Text(cartItem.item.title)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Text("\(cartItem.item.price)")
                            .font(Fonts.bold.swiftUIFont())
                            .lineLimit(1)
                    }
                    
                    HStack {
                        HStack {
                            Text("\(cartItem.quantity)")
                            Button {
                                delegate?.didTapQuantityButton(with: cartItem.item.id)
                            } label: {
                                Image(systemName: "chevron.down")
                            }
                        }
                        .foregroundColor(Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/))
                        .padding(5)
                        .background(Color.black.opacity(0.03))
                        .frame(height: 30)
                        .clipped()
                        .cornerRadius(5)
                        
                        Spacer()
                        
                        Button {
                            delegate?.didTapDeleteButton(with: cartItem.item.id)
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .foregroundColor(Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/))
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: 30, height: 30, alignment: .center)
                        .buttonStyle(.plain)
                    }
                }
                .padding(.leading)
                Spacer()
            }
        }
        .padding(.leading, 0) // Set horizontal padding to zero
        .listRowSeparator(.hidden)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
        .frame(height: 110)
        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .onTapGesture {
            delegate?.didTapCell(with: cartItem.item.id)
        }
    }
}

struct ItemCartCellView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(id: "", imageURL: "", title: "", description: "", price: 100.00)
        ItemCartCellView(cartItem: CartItem(item: item, quantity: 1), delegate: nil)
    }
}
