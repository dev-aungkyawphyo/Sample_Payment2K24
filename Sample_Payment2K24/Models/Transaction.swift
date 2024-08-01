//
//  Transaction.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 01/08/2024.
//

import Foundation

class Transaction {
    
    private var _id: Int
    var id: Int {
        return _id
    }
    
    private var _fromID: Int
    var fromID: Int {
        return _fromID
    }
    
    private var _toID: Int
    var toID: Int {
        return _toID
    }
    
    var amount: Double
    var opr: Opr
    var date: Double
    
    init(_id: Int, _fromID: Int, _toID: Int, amount: Double, opr: Opr, date: Double) {
        self._id = _id
        self._fromID = _fromID
        self._toID = _toID
        self.amount = amount
        self.opr = opr
        self.date = date
    }
    
    init(json: [String: Any]) {
        self._id = (json["id"] as? Int) ?? 0
        self._fromID = (json["fromid"] as? Int) ?? 0
        self._toID = (json["toid"] as? Int) ?? 0
        self.amount = (json["amount"] as? Double) ?? 0.0
        let oprString = (json["opr"] as? String) ?? "Un"
        self.opr = Opr.init(rawValue: oprString) ?? Opr.unknown
        self.date = (json["date"] as? Double) ?? 0.0
    }
    
}
