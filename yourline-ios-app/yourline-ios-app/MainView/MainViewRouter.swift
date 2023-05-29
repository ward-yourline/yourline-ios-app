//
//  MainViewRouter.swift
//  yourline-ios-app
//
//  Created by Warrd Adlani on 28/05/2023.
//

import Foundation
import UIKit
import SigningKit
import Utilities
import Resources

final class MainViewRouter {
    
    private weak var window: UIWindow?
    private var context: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        let navigationController = UINavigationController()
        
        mainViewController.addChild(navigationController)
        navigationController.didMove(toParent: mainViewController)
        
        mainViewController.view.addSubview(navigationController.view)
        navigationController.view.frame = mainViewController.view.frame
//
//        navigationController.view.addConstraints([
//            NSLayoutConstraint(
//                item: navigationController.view!,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: mainViewController.view!,
//                attribute: .top,
//                multiplier: 1.0,
//                constant: 0),
//            NSLayoutConstraint(
//                item: navigationController.view!,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: mainViewController.view!,
//                attribute: .top,
//                multiplier: 1.0,
//                constant: 0),
//            NSLayoutConstraint(
//                item: navigationController.view!,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: mainViewController.view!,
//                attribute: .top,
//                multiplier: 1.0,
//                constant: 0),
//            NSLayoutConstraint(
//                item: navigationController.view!,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: mainViewController.view!,
//                attribute: .top,
//                multiplier: 1.0,
//                constant: 0)
//        ]
//        )
        
        context = mainViewController
        
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        openSignInView()
    }
    
    func openSignInView() {
        let router = SignInViewRouter(context: context)
        router.start()
    }
    
    func openSignUpView() {
        
    }
    
    func openCustomerLandingView() {
        
    }
    
    func openServiceProviderLandingView() {
        
    }
    
    func initialise() {
        Fonts.install()
    }
}
