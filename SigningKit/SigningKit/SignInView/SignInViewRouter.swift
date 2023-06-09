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
import Data

public final class SignInViewRouter: SignInViewRouterProtocol {
    
    private weak var context: UIViewController?
    private weak var delegate: SignInDelegate?
    private let userStorage = UserStorage()
    
    public init(context: UIViewController?, delegate: SignInDelegate?) {
        self.context = context
        self.delegate = delegate
    }
    
    public func start() {
        if isSignedIn() {
            delegate?.didSignIn()
        } else if
            let context = context?.children.first as? UINavigationController
        {
            let webService = WebService()
            let view = SignInView(router: self, webService: webService)
            
            let viewController = UIHostingController(rootView: view)
            context.setViewControllers([viewController], animated: false)
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
    
    private func isSignedIn() -> Bool { // TODO: Put in VM
        return (userStorage.getValueForKey(.userID) != nil)
    }
}
