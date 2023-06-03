//
//  CollectionItem.swift
//  Domain
//
//  Created by Warrd Adlani on 03/06/2023.
//

import Foundation

public struct CollectionItem {
    public let id: String
    public let imageURL: String
    public let title: String
    public let description: String
    public let price: String
    
    public init(id: String, imageURL: String, title: String, description: String, price: String) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.description = description
        self.price = price
    }
}