//
//  TransactionRepository.swift
//  BankKata
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

class TransactionRepository {
    private let clock: Clock
    private var transactions = [Transaction]()

    init(clock: Clock) {
        self.clock = clock
    }

    func addDeposit(_ amount: Int) {
        let deposit = Transaction(date: clock.todayAsString(), amount: amount)
        transactions.append(deposit)
    }

    func addWithdrawal(_ amount: Int) {
        let withdrawal = Transaction(date: clock.todayAsString(), amount: -amount)
        transactions.append(withdrawal)
    }

    func allTransactions() -> [Transaction] {
        return transactions
    }
}









