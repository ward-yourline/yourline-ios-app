//
//  CustomerLandingView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 31/05/2023.
//

import SwiftUI
import Webservice
import Utilities
import Presentation
import Resources

public struct CustomerLandingView: View {
    
    private let router: CustomerLandingViewRouterProtocol
    private let webService: WebServiceProtocol
    
    internal init(
        router: CustomerLandingViewRouterProtocol,
        webService: WebServiceProtocol) {
            
        self.router = router
        self.webService = webService
    }
    
    public var body: some View {
        TabView {
            CustomerHomeView(webService: webService)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CustomerItemsSearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            CustomerCartView().tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }.badge(3)
            CustomerSettingsView().tabItem {
                Image(systemName: "ellipsis")
                Text("More")
            }
        }
        .tint(.darkSlateGray)
    }
}

struct CustomerLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerLandingView(router: CustomerLandingViewRouter(context: nil), webService: WebService())
    }
}
