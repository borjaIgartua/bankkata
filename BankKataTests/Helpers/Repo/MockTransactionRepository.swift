//
//  MockTransactionRepository.swift
//  BankKataTests
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation
@testable import BankKata

class MockTransactionRepository: TransactionRepository {
    private let stubHelper = StubWrapper()

    override init(clock: Clock) {
        super.init(clock: clock)
        
        addDepositHasBeenCalled = false
        addDepositParam = nil

        addWithdrawalHasBeenCalled = false
        addWithdrawalParam = nil
    }

    // MARK: - add Deposit
    var addDepositHasBeenCalled = false
    var addDepositParam: Int?
    override func addDeposit(_ amount: Int) {
        addDepositHasBeenCalled = true
        addDepositParam = amount
    }

    func addDeposit(_ amount: Int) -> Bool {
        return addDepositHasBeenCalled && addDepositParam == amount
    }


    // MARK: - add Withdrawal
    var addWithdrawalHasBeenCalled = false
    var addWithdrawalParam: Int?
    override func addWithdrawal(_ amount: Int) {
        addWithdrawalHasBeenCalled = true
        addWithdrawalParam = amount
    }

    func addWithdrawal(_ amount: Int) -> Bool {
        return addWithdrawalHasBeenCalled && addWithdrawalParam == amount
    }

    // MARK: - allTransactions
    override func allTransactions() -> [Transaction] {
        return stubHelper.stubedParams(for: "allTransactions() -> [Transaction]") as! [Transaction]
    }

    func allTransactions() -> Stub {
        self.stubHelper.addRunninMethod("allTransactions() -> [Transaction]")
        return stubHelper
    }
}


