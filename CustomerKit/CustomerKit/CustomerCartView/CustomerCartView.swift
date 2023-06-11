//
//  CustomerCartView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 02/06/2023.
//


import SwiftUI
import Webservice
import Utilities
import Presentation
import Resources
import Domain

public struct CustomerCartView: View {
    @StateObject private var viewModel: CustomerCartViewModel
    @State var currentPageIndex: Int = 0
    @State var totalPrice: Double = 0.0

    init(viewModel: CustomerCartViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State private var itemCount = 0

    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List {
                    ForEach(viewModel.items, id: \.id) { item in
                        ItemCartCell(cartItem: item)
                    }
                }
                .listStyle(.plain)
                
                VStack(spacing: 10) {
                    Divider()
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("£\(totalPrice)")
                    }
                    WideButton(buttonTitle: "Continue with purchase") {
                        // TODO
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
            .navigationTitle("Cart")
            .onAppear {
                viewModel.getCart()
            }
        }
    }
}

public struct ItemCartCell: View {

    private let cartItem: CartItem
    
    init(cartItem: CartItem) {
        self.cartItem = cartItem
    }
    
    public var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    AsyncImage(url: URL(string: cartItem.imageURL)) { phase in
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
                        Text(cartItem.title)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Text("\(cartItem.price)")
                            .font(Fonts.bold.swiftUIFont())
                            .lineLimit(1)
                    }
                    
                    HStack {
                        HStack {
                            Text("\(cartItem.quantity)")
                            Button {
                                // TODO
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
                            // TODO
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .foregroundColor(Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/))
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: 30, height: 30, alignment: .center)
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
    }
}

struct CustomerCartView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CustomerCartViewModel(webService: WebService())
        CustomerCartView(viewModel: vm)
    }
}
