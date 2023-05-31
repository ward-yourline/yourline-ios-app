//
//  CustomerLandingView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 31/05/2023.
//

import SwiftUI
import Webservice
import Utilities

public struct CustomerLandingView: View {
    
    private let router: CustomerLandingViewRouterProtocol
    private let webService: WebServiceProtocol
    
    internal init(router: CustomerLandingViewRouterProtocol, webService: WebServiceProtocol) {
        self.router = router
        self.webService = webService
    }
    
    public var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    List {
                        HStack(spacing: 10) {
                            Button("Hello") {
                                // TODO
                            }
                            Text("First product")
                        }
                        Text("First product")
                        Text("First product")
                    }
                }
            }
            .navigationTitle("YourLine")
        }.onAppear {
            let query = FetAllItemsQuery()
            webService.apollo.fetch(query: query) { result in
                switch result {
                case .success(let fetchAllItems):
                    if let errors = fetchAllItems.errors {
                        print(errors)
                    }
                    if let items = fetchAllItems.data?.fetchAllItems {
                        print(items)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct CustomerLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerLandingView(router: CustomerLandingViewRouter(context: nil), webService: WebService())
    }
}
