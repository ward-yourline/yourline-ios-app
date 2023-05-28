//
//  UIViewController+Extensions.swift
//  Utilities
//
//  Created by Warrd Adlani on 28/05/2023.
//

import UIKit
import Foundation

public extension UIViewController {
    class func instantiate(with storyboardName: String, identifier: String) -> Self? {
        let bundle = Bundle(for: Self.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard
            let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self
        else {
            fatalError("failed to instantiate \(identifier)")
        }
        return viewController
    }
}
