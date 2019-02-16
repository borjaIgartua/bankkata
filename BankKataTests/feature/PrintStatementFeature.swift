//
//  PrintStatementFeature.swift
//  BankKataTests
//
//  Created by Borja Igartua on 13.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import XCTest
@testable import BankKata

class PrintStatementFeature: XCTestCase {

    private var console = MockConsole()
    private var account: Account!
    private var clock: MockClock!

    override func setUp() {
        console = MockConsole()
        clock = MockClock()
        
        let repository = TransactionRepository(clock: clock)
        let printer = StatementPrinter(printer: console)
        account = NationalAccount(repository: repository, printer: printer)
    }

    func testStatementContainsAllTransactions() {
        
        clock.todayAsString().willReturn("01/04/2018", "02/04/2018", "10/04/2018")
        
        account.deposit(1000)
        account.withdraw(100)
        account.deposit(500)
        account.printStatement()

        XCTAssertTrue(console.printLine("DATE | AMOUNT | BALANCE"))
        XCTAssertTrue(console.printLine("10/04/2018 | 500.00 | 1400.00"))
        XCTAssertTrue(console.printLine("02/04/2018 | -100.00 | 900.00"))
        XCTAssertTrue(console.printLine("01/04/2018 | 1000.00 | 1000.00"))
    }
}




