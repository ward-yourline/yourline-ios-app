//
//  Colors.swift
//  Resources
//
//  Created by Warrd Adlani on 29/05/2023.
//

import Foundation
import SwiftUI
import Utilities

public enum CustomColors: String {
    case blue = "75BCD2"
    case darkGrey = "3b5e69"
    
    public var color: Color {
        return Color(hex: self.rawValue)
    }
}
