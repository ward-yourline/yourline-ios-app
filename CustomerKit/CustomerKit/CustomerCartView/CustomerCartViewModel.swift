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
import Utilities

class CustomerCartViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    
    @Published var items: [CartItem] = [] {
        didSet {
            BadgeHandler.instance.setBadgeCount(items.count)
        }
    }
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
                
                guard let items = result.data?.fetchCart?.items else { return }
                
                let cartItems = items.compactMap { item in
                    CartItem(
                        id: item?.id ?? "",
                        imageURL: item?.mainImage ?? "",
                        title: item?.name ?? "",
                        description: "",
                        price: ceil(item!.value * 10) / 10.0,
                        quantity: item?.quantity ?? 0
                    )
                }
                
                self.items = cartItems
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}
