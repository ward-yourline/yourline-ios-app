//
//  CustomerLandingViewRouter.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 31/05/2023.
//

import UIKit
import Utilities
import Foundation
import SwiftUI
import Webservice

public protocol CustomerLandingViewRouterProtocol: AnyObject {
    init(context: UIViewController?)
    func start()
}

public final class CustomerLandingViewRouter: CustomerLandingViewRouterProtocol {
    
    private weak var context: UIViewController?
    
    public init(context: UIViewController?) {
        self.context = context
    }
    
    public func start() {
        if
            let context = context?.children.first as? UINavigationController
        {
            context.viewControllers.removeAll()
            //            let webService = WebService()
            //            let view = SignInView(router: self, webService: webService)
            let view = CustomerLandingView()
            
            let viewController = UIHostingController(rootView: view)
            context.pushViewController(viewController, animated: false)
        }
    }
}
