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
    private let viewModel: CustomerCartViewModel
    
    @State private var badgeValue = 0
    
    internal init(
        router: CustomerLandingViewRouterProtocol,
        webService: WebServiceProtocol
    ) {
        self.router = router
        self.webService = webService
        self.viewModel = CustomerCartViewModel(webService: webService)
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
            
            CustomerCartView(viewModel: viewModel).tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }.badge(badgeValue)
            CustomerSettingsView().tabItem {
                Image(systemName: "ellipsis")
                Text("More")
            }
        }
        .tint(.darkSlateGray)
        .onAppear() {
            BadgeHandler.instance.updateBlock = { count in
                badgeValue = count
            }
            viewModel.getCart()
        }
    }
}

struct CustomerLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerLandingView(router: CustomerLandingViewRouter(context: nil), webService: WebService())
    }
}
