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

public final class SignInViewRouter: SignInViewRouterProtocol {
    
    private weak var context: UIViewController?
    private weak var delegate: SignInDelegate?
    
    public init(context: UIViewController?, delegate: SignInDelegate?) {
        self.context = context
        self.delegate = delegate
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
    
    public func didSignIn() {
        delegate?.didSignIn()
    }
}
