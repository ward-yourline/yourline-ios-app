// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetAllItemsQuery: GraphQLQuery {
  public static let operationName: String = "FetAllItems"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FetAllItems {
        fetchAllItems {
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

  public init() {}

  public struct Data: SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchAllItems", [FetchAllItem?]?.self),
    ] }

    public var fetchAllItems: [FetchAllItem?]? { __data["fetchAllItems"] }

    /// FetchAllItem
    ///
    /// Parent Type: `Item`
    public struct FetchAllItem: SelectionSet {
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
