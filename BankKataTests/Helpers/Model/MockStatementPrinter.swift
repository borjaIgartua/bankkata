//
//  MockStatementPrinter.swift
//  BankKataTests
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

@testable import BankKata

class MockStatementPrinter: StatementPrinter {

    var printHasBeenCalled = false
    var printParam: [Transaction]?
    override func print(_ transactions: [Transaction]) {
        printHasBeenCalled = true
        printParam = transactions
    }

    func print(_ transactions: [Transaction]) -> Bool {
        return printHasBeenCalled && printParam == transactions
    }
}



