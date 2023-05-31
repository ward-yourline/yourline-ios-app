//
//  WebService.swift
//  Webservice
//
//  Created by Warrd Adlani on 31/05/2023.
//

import Foundation

public typealias RequestCompletion = (Result<Data, Error>) -> Void

public protocol WebServiceProtocol {
    func signIn(with email: String, password: String, and completion: @escaping RequestCompletion)
    func signUp(with email: String, password: String, and completion: @escaping RequestCompletion)
    func getItems()
}
public final class WebService {
    
    public func signIn(with email: String, password: String, and completion: @escaping RequestCompletion) {
        // Magic here
    }
    
    public func signUp(with email: String, password: String, and completion: @escaping RequestCompletion) {
        // Magic here
    }
    
    public func getItems() {
        // Magic here
    }
}
