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

  public struct Data: YourLineAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { YourLineAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchItems", [FetchItem?]?.self, arguments: ["limit": .variable("limit")]),
    ] }

    public var fetchItems: [FetchItem?]? { __data["fetchItems"] }

    /// FetchItem
    ///
    /// Parent Type: `Item`
    public struct FetchItem: YourLineAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { YourLineAPI.Objects.Item }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("id", YourLineAPI.ID.self),
        .field("type", String.self),
        .field("parentID", YourLineAPI.ID?.self),
        .field("categoryID", YourLineAPI.ID?.self),
        .field("description", String?.self),
        .field("mainImage", String?.self),
      ] }

      public var name: String { __data["name"] }
      public var id: YourLineAPI.ID { __data["id"] }
      public var type: String { __data["type"] }
      public var parentID: YourLineAPI.ID? { __data["parentID"] }
      public var categoryID: YourLineAPI.ID? { __data["categoryID"] }
      public var description: String? { __data["description"] }
      public var mainImage: String? { __data["mainImage"] }
    }
  }
}
