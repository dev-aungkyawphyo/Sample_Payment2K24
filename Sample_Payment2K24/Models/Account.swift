//
//  Account.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 30/07/2024.
//

import Foundation

class Account {
    
    private var _id: Int
    var id: Int {
        return _id
    }
    
    private var _username: String
    var username: String {
        return _username
    }
    
    private var _isAdmin = false
    var isAdmin: Bool {
        return _isAdmin
    }
    
    private var _dbManager = DBManager()
    
    init(_id: Int, _username: String, _isAdmin: Bool) {
        self._id = _id
        self._username = _username
        self._isAdmin = _isAdmin
    }
    
    init(userDictionary: [String: Any]) {
        self._id = userDictionary["id"] as? Int ?? 0
        self._username = userDictionary["username"] as? String ?? ""
        self._isAdmin = (userDictionary["isAdmin"] as? Int ?? 0) == 1
    }
    
    
}
