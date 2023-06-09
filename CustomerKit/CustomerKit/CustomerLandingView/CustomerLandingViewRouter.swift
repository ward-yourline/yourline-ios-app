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

public protocol SignOutDelegate: AnyObject {
    func didSignOut()
}

public protocol CustomerLandingViewRouterProtocol: AnyObject {
    init(context: UIViewController?, delegate: SignOutDelegate?)
    func didSignOut()
    func start()
}

public final class CustomerLandingViewRouter: CustomerLandingViewRouterProtocol {
    
    private weak var context: UIViewController?
    private weak var delegate: SignOutDelegate?
    
    public init(context: UIViewController?, delegate: SignOutDelegate?) {
        self.context = context
        self.delegate = delegate
    }
    
    public func start() {
        if
            let context = context?.children.first as? UINavigationController
        {
            context.viewControllers.removeAll()
            
            let webService = WebService()
            let view = CustomerLandingView(router: self, webService: webService)
            
            let viewController = UIHostingController(rootView: view)
            context.pushViewController(viewController, animated: false)
        }
    }
    
    public func didSignOut() {
        delegate?.didSignOut()
    }
}
