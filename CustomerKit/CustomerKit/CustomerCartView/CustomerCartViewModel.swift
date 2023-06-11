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
    private var cartID: String = ""
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func getCart() {
        let query = FetchCartQuery(id: "cart__2R3Spm0CJG398iCrBhnolN7JPUp")
        
        webService.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let result):
                if let errors = result.errors {
                    print(errors)
                }
                
                guard let cart = result.data?.fetchCart else { return }
                guard let items = cart.items else { return }
            
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
                self.cartID = cart.id
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func removeItemFromCart(with id: String, completion: ((String) -> Void)) {
        
        let mutation = RemoveItemFromCartMutation(cartID: cartID, itemID: id)
        
        webService.apollo.perform(mutation: mutation) { [weak self] result in
            switch result {
                
            case .success(let graphResult):
                
                if graphResult.errors == nil {
                    self?.items.removeAll { cartItem in
                        cartItem.id == id
                    }
                }
                
            case .failure(_):
                // TODO
                break
            }
        }
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}
