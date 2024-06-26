// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetchCartQuery: GraphQLQuery {
  public static let operationName: String = "FetchCart"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FetchCart($id: ID!) {
        fetchCart(cartID: $id, limit: 10) {
          __typename
          id
          items {
            __typename
            quantity
            value
            mainImage
            name
            id
          }
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
      .field("fetchCart", FetchCart?.self, arguments: [
        "cartID": .variable("id"),
        "limit": 10
      ]),
    ] }

    public var fetchCart: FetchCart? { __data["fetchCart"] }

    /// FetchCart
    ///
    /// Parent Type: `Cart`
    public struct FetchCart: SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Objects.Cart }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", ID.self),
        .field("items", [Item?]?.self),
      ] }

      public var id: ID { __data["id"] }
      public var items: [Item?]? { __data["items"] }

      /// FetchCart.Item
      ///
      /// Parent Type: `CartItem`
      public struct Item: SelectionSet {
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
        ] }

        public var quantity: Int { __data["quantity"] }
        public var value: Double { __data["value"] }
        public var mainImage: String { __data["mainImage"] }
        public var name: String { __data["name"] }
        public var id: ID { __data["id"] }
      }
    }
  }
}
