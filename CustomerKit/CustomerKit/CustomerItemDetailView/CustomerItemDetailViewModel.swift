//
//  CustomerItemDetailViewModel.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 11/06/2023.
//

import Foundation
import SwiftUI
import Domain
import Resources
import Utilities
import Presentation
import Webservice
import Data

public class CustomerItemDetailViewModel: ObservableObject {
    
    internal let item: Item
    internal var quantity: Int = 1
    private let webService: WebServiceProtocol
    private let userStorage: UserStorageProtocol
    
    init(item: Item, webService: WebServiceProtocol, userStorage: UserStorageProtocol) {
        self.item = item
        self.webService = webService
        self.userStorage = userStorage
    }
    
    func addItemToCart() {
        guard
            let userID = userStorage.getValueForKey(.userID)
        else {
            return
        }
        
        let mutation = AddItemToCartMutation(userID: userID, itemID: item.id, quantity: quantity)
        webService.apollo.perform(mutation: mutation) { [weak self] result in
            switch result {
                
            case .success(let graphResult):
                if let err = graphResult.errors {
                    print(err.first)
                }
                if let success = graphResult.data?.addItemToCart, success {
                    // Show toast
                    self?.getCart()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCart() { // TODO: Fix this duplicate found in cart view model
        let query = FetchCartQuery(id: "cart__2R3Spm0CJG398iCrBhnolN7JPUp") // TODO: Fix
        
        webService.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { [weak self] result in
            switch result {
            case .success(let result):
                if let errors = result.errors {
                    print(errors)
                }
                
                guard let cart = result.data?.fetchCart else { return }
                guard let count = cart.items?.count else { return }
                
                let query = FetchCartQuery(id: "cart__2R3Spm0CJG398iCrBhnolN7JPUp")
                
                self?.webService.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
                    switch result {
                    case .success(let result):
                        if let errors = result.errors {
                            print(errors)
                        }
                        
                        guard let cart = result.data?.fetchCart else { return }
                        guard let items = cart.items else { return }
                        
                        BadgeHandler.instance.setBadgeCount(count)
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
