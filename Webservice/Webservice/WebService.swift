//
//  WebService.swift
//  Webservice
//
//  Created by Warrd Adlani on 31/05/2023.
//

import Foundation
import Apollo

public typealias RequestCompletion = (Result<Data, Error>) -> Void

public protocol WebServiceProtocol {
    
    var apollo: ApolloClient { get }
    
    func signIn(with email: String, password: String, and completion: @escaping RequestCompletion)
    func signUp(with email: String, password: String, and completion: @escaping RequestCompletion)
    func getItems()
    
    init()
}

public final class WebService: WebServiceProtocol {
    
    static let shared = WebService()
    
    let url = "http://localhost:8080/query"
    
    public private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
    
    public init() {}
    
    public func signIn(with email: String, password: String, and completion: @escaping RequestCompletion) {
        // Magic here

        let input = YourLineAPI.UserSignInInput(email: email, password: password)
        let query = YourLineAPI.SignInQuery(input: input)

        apollo.fetch(query: query) { result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    public func signUp(with email: String, password: String, and completion: @escaping RequestCompletion) {
        // Magic here
    }
    
    public func getItems() {
        // Magic here
    }
}
