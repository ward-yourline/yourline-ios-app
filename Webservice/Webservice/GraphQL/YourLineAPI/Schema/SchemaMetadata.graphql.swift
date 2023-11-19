// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol YourLineAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == YourLineAPI.SchemaMetadata {}

public protocol YourLineAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == YourLineAPI.SchemaMetadata {}

public protocol YourLineAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == YourLineAPI.SchemaMetadata {}

public protocol YourLineAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == YourLineAPI.SchemaMetadata {}

public extension YourLineAPI {
  typealias ID = String

  typealias SelectionSet = YourLineAPI_SelectionSet

  typealias InlineFragment = YourLineAPI_InlineFragment

  typealias MutableSelectionSet = YourLineAPI_MutableSelectionSet

  typealias MutableInlineFragment = YourLineAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return YourLineAPI.Objects.Query
      case "Authentication": return YourLineAPI.Objects.Authentication
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}