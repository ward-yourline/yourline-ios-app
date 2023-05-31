//
//  SignInViewRouter.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import UIKit
import Utilities
import Foundation
import SwiftUI
import Webservice

public protocol SignInViewRouterProtocol: AnyObject {
    init(context: UIViewController?)
    func start()
}

public final class SignInViewRouter: SignInViewRouterProtocol {
    
    private weak var context: UIViewController?
    
    public init(context: UIViewController?) {
        self.context = context
    }
    
    public func start() {
        if
            let context = context?.children.first as? UINavigationController
        {
            let webService = WebService()
            let view = SignInView(router: self, webService: webService)
            
            let viewController = UIHostingController(rootView: view)
            context.pushViewController(viewController, animated: true)
        }
    }
    
    public func openSignUpView() {
        let router = SignUpViewRouter(context: context)
        router.start()
    }
    
    public func openForgotPasswordView() {
        // TODO
    }
    
    public func openCustomerLandingView() {
        print("Opening customer landing view")
    }
}
