//
//  TransactionRepositoryTests.swift
//  BankKataTests
//
//  Created by Borja Igartua on 15.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import XCTest
@testable import BankKata

class TransactionRepositoryTests: XCTestCase {
    private var transactionRepository: TransactionRepository!
    private var clock: MockClock!

    let TODAY = "12/05/2018"

    override func setUp() {
        clock = MockClock()
        transactionRepository = TransactionRepository(clock : clock)
    }

    func testCreateAndStoreTransaction() {

        clock.todayAsString().willReturn(TODAY)
        transactionRepository.addDeposit(100)


        let transactions = transactionRepository.allTransactions()

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions[0], Transaction(date: TODAY, amount: 100))
    }
}



