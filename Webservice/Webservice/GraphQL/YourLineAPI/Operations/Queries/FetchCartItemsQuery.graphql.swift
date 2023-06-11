// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetchCartItemsQuery: GraphQLQuery {
  public static let operationName: String = "FetchCartItems"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FetchCartItems($id: ID!) {
        fetchCartItems(cartID: $id, limit: 10) {
          __typename
          quantity
          value
          mainImage
          name
          id
          cartID
        }
      }
      """#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchCartItems", [FetchCartItem?]?.self, arguments: [
        "cartID": .variable("id"),
        "limit": 10
      ]),
    ] }

    public var fetchCartItems: [FetchCartItem?]? { __data["fetchCartItems"] }

    /// FetchCartItem
    ///
    /// Parent Type: `CartItem`
    public struct FetchCartItem: SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Objects.CartItem }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("quantity", Int.self),
        .field("value", Double.self),
        .field("mainImage", String.self),
        .field("name", String.self),
        .field("id", ID.self),
        .field("cartID", ID.self),
      ] }

      public var quantity: Int { __data["quantity"] }
      public var value: Double { __data["value"] }
      public var mainImage: String { __data["mainImage"] }
      public var name: String { __data["name"] }
      public var id: ID { __data["id"] }
      public var cartID: ID { __data["cartID"] }
    }
  }
}
