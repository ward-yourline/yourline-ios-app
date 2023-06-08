//
//  CustomerCartViewModel.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 08/06/2023.
//


import Foundation
import Webservice
import Domain
import Presentation

class CustomerCartViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    
    @Published var items: [CartItem] = []
    @Published var isShowingDetailView = false
    @Published var selectedItem: Item?
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    
    func getCart() {
        let query = FetchCart(id: "user_2Pxr0hbhyKVdtGAPUhx9eN230Re")
        
        webService.apollo.fetch(query: query) { result in
            switch result {
            case .success(let result):
                if let errors = result.errors {
                    print(errors)
                }
                guard let cartItems = result.data?.fetchCart?.items?.compactMap({ item in
                    return CartItem(
                        id: item?.id ?? "",
                        imageURL: "",
                        title: "",
                        description: "",
                        price: item?.value ?? 0.0,
                        quantity: item?.quantity ?? 0
                    )
                }) else {
                    return
                }
                self.items.append(contentsOf: cartItems)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
