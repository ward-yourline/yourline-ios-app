//
//  BadgeHandler.swift
//  Utilities
//
//  Created by Warrd Adlani on 09/06/2023.
//

import Foundation
import SwiftUI

public class BadgeHandler {
    
    @State public var count: Int = 0
    
    public static var instance = BadgeHandler()
    public var updateBlock: ((Int) -> Void)?
    
    private init() {}
    
    public func setBadgeCount(_ count: Int) {
        self.count = count
        updateBlock?(count)
    }
}
