//
//  NationalAccountTests.swift
//  BankKataTests
//
//  Created by Borja Igartua on 13.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import XCTest
@testable import BankKata

class NationalAccountTests: XCTestCase {

    private var transactionRepository: MockTransactionRepository!
    private var account: NationalAccount!
    private var statementPrinter: MockStatementPrinter!
    private var clock: MockClock!

    override func setUp() {
        clock = MockClock()
        transactionRepository = MockTransactionRepository(clock: clock)
        statementPrinter = MockStatementPrinter(printer: MockConsole())
        account = NationalAccount(repository: transactionRepository, printer: statementPrinter)

    }

    func testStoreDepositTransaction() {
        account.deposit(100);

        XCTAssertTrue(transactionRepository.addDeposit(100))
    }

    func testStoreWithdrawalTransaction() {
        account.withdraw(100);

        XCTAssertTrue(transactionRepository.addWithdrawal(100))
    }

    func testPrintAStatement() {
        let transactions = [Transaction]()
        transactionRepository.allTransactions().willReturn(transactions)

        account.printStatement()

        XCTAssertTrue(statementPrinter.print(transactions))
    }
}


