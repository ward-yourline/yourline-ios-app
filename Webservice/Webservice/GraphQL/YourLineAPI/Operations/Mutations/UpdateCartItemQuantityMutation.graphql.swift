// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateCartItemQuantityMutation: GraphQLMutation {
  public static let operationName: String = "UpdateCartItemQuantity"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation UpdateCartItemQuantity($itemID: ID!, $cartID: ID!, $quantity: Int!) {
        updateCartItemQuantity(itemID: $itemID, cartID: $cartID, quantity: $quantity)
      }
      """#
    ))

  public var itemID: ID
  public var cartID: ID
  public var quantity: Int

  public init(
    itemID: ID,
    cartID: ID,
    quantity: Int
  ) {
    self.itemID = itemID
    self.cartID = cartID
    self.quantity = quantity
  }

  public var __variables: Variables? { [
    "itemID": itemID,
    "cartID": cartID,
    "quantity": quantity
  ] }

  public struct Data: YourLineAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { YourLineAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updateCartItemQuantity", Bool.self, arguments: [
        "itemID": .variable("itemID"),
        "cartID": .variable("cartID"),
        "quantity": .variable("quantity")
      ]),
    ] }

    public var updateCartItemQuantity: Bool { __data["updateCartItemQuantity"] }
  }
}
