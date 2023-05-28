//
//  SignInViewRouter.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import UIKit
import Utilities
import Foundation

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
        let view = SignInViewController.instantiate(with: "SignInView", identifier: "SignInViewController")
        
        if
            let view = view,
            let context = context?.children.first as? UINavigationController
        {
            context.pushViewController(view, animated: false)
        }
    }
}
