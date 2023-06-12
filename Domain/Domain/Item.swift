//
//  Item.swift
//  Domain
//
//  Created by Warrd Adlani on 03/06/2023.
//

import Foundation

public struct Item {
    public let id: String
    public let imageURL: String
    public let title: String
    public let description: String
    public let price: Double
    
    public init(id: String, imageURL: String, title: String, description: String, price: Double) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.description = description
        self.price = price
    }
}


public struct CartItem {
    public let item: Item
    public var quantity: Int
    
    public init(item: Item, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
}
