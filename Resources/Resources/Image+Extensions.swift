//
//  Image+Extensions.swift
//  Resources
//
//  Created by Warrd Adlani on 04/06/2023.
//

import Foundation
import SwiftUI

public extension Image {
    init(_ named: String) {
        self.init(named, bundle: Bundle(identifier: "com.yourline.resources"))
    }
}

public extension Color {
    init(_ colorName: String) {
        self.init(colorName, bundle: Bundle(identifier: "com.yourline.resources"))
    }
}
