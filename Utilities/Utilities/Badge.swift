//
//  Badge.swift
//  Utilities
//
//  Created by Warrd Adlani on 03/06/2023.
//

import Foundation

public class BadgeCount: ObservableObject {
    @Published public var count: Int = 0
    
    public init(){}
}
