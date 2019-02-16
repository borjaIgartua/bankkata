//
//  Transaction.swift
//  BankKata
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

class Transaction: Equatable {
    private(set) var date: String
    private(set) var amount: Int

    init(date: String, amount: Int) {
        self.date = date
        self.amount = amount
    }
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.date == rhs.date && lhs.amount == rhs.amount
    }
}
