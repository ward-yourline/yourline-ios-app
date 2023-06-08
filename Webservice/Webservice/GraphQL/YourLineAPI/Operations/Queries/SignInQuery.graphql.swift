// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SignInQuery: GraphQLQuery {
  public static let operationName: String = "signIn"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query signIn($input: UserSignInInput!) {
        signIn(input: $input) {
          __typename
          id
          accessToken
          refreshToken
        }
      }
      """#
    ))

  public var input: UserSignInInput

  public init(input: UserSignInInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: YourLineAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { YourLineAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("signIn", SignIn.self, arguments: ["input": .variable("input")]),
    ] }

    public var signIn: SignIn { __data["signIn"] }

    /// SignIn
    ///
    /// Parent Type: `Authentication`
    public struct SignIn: YourLineAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { YourLineAPI.Objects.Authentication }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", YourLineAPI.ID.self),
        .field("accessToken", String.self),
        .field("refreshToken", String.self),
      ] }

      public var id: YourLineAPI.ID { __data["id"] }
      public var accessToken: String { __data["accessToken"] }
      public var refreshToken: String { __data["refreshToken"] }
    }
  }
}
