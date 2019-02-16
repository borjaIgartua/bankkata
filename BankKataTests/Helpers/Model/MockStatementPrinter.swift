//
//  MockStatementPrinter.swift
//  BankKataTests
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

@testable import BankKata

class MockStatementPrinter: StatementPrinter {

    var printCalls = [[Transaction]]()
    override func print(_ transactions: [Transaction]) {
        printCalls.append(transactions)
    }

    func print(_ transactions: [Transaction]) -> Bool {
        return printCalls.contains(transactions)
    }
}



