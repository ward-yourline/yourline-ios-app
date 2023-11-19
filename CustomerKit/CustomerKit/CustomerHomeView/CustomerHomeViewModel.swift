//
//  CustomerHomeViewModel.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 02/06/2023.
//

import Foundation
import Webservice
import Domain
import Presentation

class CustomerHomeViewModel: ObservableObject, ItemsCollectionViewDelegate {
    private let webService: WebServiceProtocol
    
    @Published var items: [Item] = []
    @Published var isShowingDetailView = false
    @Published var selectedItem: Item?
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func getItems() {
        print("getItems() called")
//        let query = FetchItemsQuery(limit: 6)
//        webService.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
//            switch result {
//            case .success(let fetchAllItems):
//                if let errors = fetchAllItems.errors {
//                    print(errors)
//                }
//                if let items = fetchAllItems.data?.fetchItems {
//                    DispatchQueue.main.async {
//                        self.items = items.compactMap { $0 }.map { item in
//                            Item(
//                                id: item.id,
//                                imageURL: item.mainImage ?? "",
//                                title: item.name,
//                                description: item.description ?? "",
//                                price: 100.00
//                            )
//                        }
//                    }
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    func didTapItem(with id: String, at index: Int) {
        guard let selectedItem = items.first(where: { $0.id == id }) else {
            return
        }
        
        self.selectedItem = selectedItem
        self.isShowingDetailView = true
    }
}
