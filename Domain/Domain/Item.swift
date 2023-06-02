//
//  Item.swift
//  Domain
//
//  Created by Warrd Adlani on 02/06/2023.
//

import Foundation

public struct Item {
    
    public let name: String
    public let id: String
    public let type: String
    public let parentID: String?
    public let description: String?
    public let mainImage: String?
    
    public init(name: String, id: String, type: String, parentID: String? = nil, description: String? = nil, mainImage: String? = nil) {
        self.name = name
        self.id = id
        self.type = type
        self.parentID = parentID
        self.description = description
        self.mainImage = mainImage
    }
}
