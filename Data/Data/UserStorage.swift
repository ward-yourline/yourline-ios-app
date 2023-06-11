//
//  UserStorage.swift
//  Data
//
//  Created by Warrd Adlani on 09/06/2023.
//

import Foundation
import KeychainSwift

public enum UserKeys: String, CaseIterable {
    
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
    case userID = "user_id"
    
    public var key: String {
        return self.rawValue
    }
}

public protocol UserStorageProtocol {
    init()
    func setValue(_ value: String, for key: UserKeys) -> Bool
    func getValueForKey(_ key: UserKeys) -> String?
    func clearUserData()
}

public final class UserStorage: UserStorageProtocol {
    
    private lazy var keychain = KeychainSwift()
    
    public init() {}
    
    @discardableResult
    public func setValue(_ value: String, for key: UserKeys) -> Bool {
        keychain.set(value, forKey: key.key)
    }
    
    @discardableResult
    public func getValueForKey(_ key: UserKeys) -> String? {
        return keychain.get(key.key)
    }
    
    public func clearUserData() {
        for key in UserKeys.allCases {
            let success = keychain.delete(key.key)
            print("key: \(key) deleted with success: \(success)")
        }
    }
}
