// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetchItemsQuery: GraphQLQuery {
  public static let operationName: String = "FetchItems"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FetchItems($limit: Int!) {
        fetchItems(limit: $limit) {
          __typename
          name
          id
          type
          parentID
          categoryID
          description
          mainImage
        }
      }
      """#
    ))

  public var limit: Int

  public init(limit: Int) {
    self.limit = limit
  }

  public var __variables: Variables? { ["limit": limit] }

  public struct Data: SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchItems", [FetchItem?]?.self, arguments: ["limit": .variable("limit")]),
    ] }

    public var fetchItems: [FetchItem?]? { __data["fetchItems"] }

    /// FetchItem
    ///
    /// Parent Type: `Item`
    public struct FetchItem: SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Objects.Item }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("id", ID.self),
        .field("type", String.self),
        .field("parentID", ID?.self),
        .field("categoryID", ID?.self),
        .field("description", String?.self),
        .field("mainImage", String?.self),
      ] }

      public var name: String { __data["name"] }
      public var id: ID { __data["id"] }
      public var type: String { __data["type"] }
      public var parentID: ID? { __data["parentID"] }
      public var categoryID: ID? { __data["categoryID"] }
      public var description: String? { __data["description"] }
      public var mainImage: String? { __data["mainImage"] }
    }
  }
}
