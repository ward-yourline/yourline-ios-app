//
//  Protocols.swift
//  SigningKit
//
//  Created by Warrd Adlani on 31/05/2023.
//

import Foundation
import UIKit

public protocol SignInDelegate: AnyObject {
    func didSignIn()
}

public protocol SignInViewRouterProtocol: AnyObject {
    init(context: UIViewController?, delegate: SignInDelegate?)
    func start()
}
