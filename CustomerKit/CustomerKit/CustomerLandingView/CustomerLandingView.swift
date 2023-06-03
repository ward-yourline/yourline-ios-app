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
                    Image("home-home_symbol")
                    Text("Home")
                }
            CustomerStoreView().tabItem {
                Image("store-store_symbol")
                Text("Store")
            }
            CustomerCartView().tabItem {
                Image("shopping_cart-shopping_cart_symbol")
                Text("Cart")
            }
            CustomerSettingsView().tabItem {
                Image("settings-settings_symbol")
                Text("Settings")
            }
        }
        .tint(CustomColors.darkGrey.color)
    }
}

struct CustomerLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerLandingView(router: CustomerLandingViewRouter(context: nil), webService: WebService())
    }
}
