// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddItemToCartMutation: GraphQLMutation {
  public static let operationName: String = "AddItemToCart"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation AddItemToCart($userID: ID!, $itemID: ID!, $quantity: Int!) {
        addItemToCart(userID: $userID, itemID: $itemID, quantity: $quantity)
      }
      """#
    ))

  public var userID: ID
  public var itemID: ID
  public var quantity: Int

  public init(
    userID: ID,
    itemID: ID,
    quantity: Int
  ) {
    self.userID = userID
    self.itemID = itemID
    self.quantity = quantity
  }

  public var __variables: Variables? { [
    "userID": userID,
    "itemID": itemID,
    "quantity": quantity
  ] }

  public struct Data: SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addItemToCart", Bool.self, arguments: [
        "userID": .variable("userID"),
        "itemID": .variable("itemID"),
        "quantity": .variable("quantity")
      ]),
    ] }

    public var addItemToCart: Bool { __data["addItemToCart"] }
  }
}
