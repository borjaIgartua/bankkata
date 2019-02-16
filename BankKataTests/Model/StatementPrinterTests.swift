//
//  StatementPrinterTests.swift
//  BankKataTests
//
//  Created by Borja Igartua Pastor on 15/02/2019.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import XCTest
@testable import BankKata

class StatementPrinterTests: XCTestCase {
    private var console: MockConsole!
    private var statementPrinter: StatementPrinter!
    
    let STATEMENT_HEADER = "DATE | AMOUNT | BALANCE"
    
    override func setUp() {
        self.console = MockConsole()
        self.statementPrinter = StatementPrinter(printer: console)
    }
    
    func testAlwaysPrintHeader() {
        statementPrinter.print([Transaction]())
        
        XCTAssertTrue(console.printLine(STATEMENT_HEADER))
    }
    
    func testPrintTransactionsInChronologicalReverseOrder() {
        
        
        let depositOne = Transaction(date: "10/04/2018", amount: 500)
        let withdrawal = Transaction(date: "02/04/2018", amount: -100)
        let depositTwoo = Transaction(date: "01/04/2018", amount: 1000)
        statementPrinter.print([depositOne, withdrawal, depositTwoo])
        
        XCTAssertTrue(console.printLine(STATEMENT_HEADER))
        XCTAssertTrue(console.printLine("10/04/2018 | 500.00 | 1400.00"))
        XCTAssertTrue(console.printLine("02/04/2018 | -100.00 | 900.00"))
        XCTAssertTrue(console.printLine("01/04/2018 | 1000.00 | 1000.00"))
    }
}





