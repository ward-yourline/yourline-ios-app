// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveItemFromCartMutation: GraphQLMutation {
  public static let operationName: String = "RemoveItemFromCart"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation RemoveItemFromCart($cartID: ID!, $itemID: ID!) {
        removeItemFromCart(cartID: $cartID, itemID: $itemID)
      }
      """#
    ))

  public var cartID: ID
  public var itemID: ID

  public init(
    cartID: ID,
    itemID: ID
  ) {
    self.cartID = cartID
    self.itemID = itemID
  }

  public var __variables: Variables? { [
    "cartID": cartID,
    "itemID": itemID
  ] }

  public struct Data: SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("removeItemFromCart", Bool.self, arguments: [
        "cartID": .variable("cartID"),
        "itemID": .variable("itemID")
      ]),
    ] }

    public var removeItemFromCart: Bool { __data["removeItemFromCart"] }
  }
}
