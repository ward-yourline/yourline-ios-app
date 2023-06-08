//
//  Item.swift
//  Domain
//
//  Created by Warrd Adlani on 03/06/2023.
//

import Foundation

public struct CartItem {
    public let id: String
    public let imageURL: String
    public let title: String
    public let description: String
    public let quantity: Int
    public let price: Double
    
    public init(id: String, imageURL: String, title: String, description: String, price: Double, quantity: Int) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.description = description
        self.price = price
        self.quantity = quantity
    }
}


public struct Item {
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
