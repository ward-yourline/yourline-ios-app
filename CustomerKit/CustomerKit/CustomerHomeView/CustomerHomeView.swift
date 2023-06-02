//
//  CustomerHomeView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Webservice
import Utilities
import Presentation

typealias Item = Webservice.FetAllItemsQuery.Data.FetchAllItem

struct CustomerHomeView: View {
    private let webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    @State private var items = [Item]()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ItemsCollectionView(items: items.map({ item in
                        return CollectionItem(
                            id: item.id,
                            imageURL: item.mainImage ?? "",
                            title: item.name,
                            subTitle: item.description ?? ""
                        )
                    })).padding(.horizontal, 10)
                        .refreshable {
                            // TODO
                        }
                }
            }
            .navigationTitle("Home")
        }
        .onAppear {
            getItems()
        }
    }
    
    func getItems() {
        let query = FetAllItemsQuery()
        webService.apollo.fetch(query: query) { result in
            switch result {
            case .success(let fetchAllItems):
                if let errors = fetchAllItems.errors {
                    print(errors)
                }
                if let items = fetchAllItems.data?.fetchAllItems {
                    DispatchQueue.main.async {
                        self.items = items.compactMap { $0 }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


struct CustomerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerHomeView(webService: WebService())
    }
}
