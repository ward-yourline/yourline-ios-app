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
    @StateObject fileprivate var viewModel: CustomerCartViewModel
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
                    ForEach(viewModel.items, id: \.item.id) { item in
                        ItemCartCellView(cartItem: item, delegate: self)
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

extension CustomerCartView: ItemCartCellDelegate {
    public func didTapDeleteButton(with id: String) {
        viewModel.removeItemFromCart(with: id) { result in
                // TODO
        }
    }
    
    public func didTapCell(with id: String) {
//        NavigationView {
//            let webService = WebService()
//            let viewModel = CustomerItemDetailViewModel(item: <#T##Item#>, webService: <#T##WebServiceProtocol#>, userStorage: <#T##UserStorageProtocol#>)
//            CustomerItemDetailView(viewModel: <#T##CustomerItemDetailViewModel#>)
//        }
    }
    
    public func didTapQuantityButton(with id: String) {
        // TODO
    }
}

struct CustomerCartView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CustomerCartViewModel(webService: WebService())
        CustomerCartView(viewModel: vm)
    }
}
