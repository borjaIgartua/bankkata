//
//  Account.swift
//  BankKata
//
//  Created by Borja Igartua on 13.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

protocol Account {
    func deposit(_ amount: Int)
    func withdraw(_ amount: Int)
    func printStatement()
}

class NationalAccount: Account {
    private var repository: TransactionRepository
    private var printer: StatementPrinter

    init(repository: TransactionRepository, printer: StatementPrinter) {
        self.repository = repository
        self.printer = printer
    }

    func deposit(_ amount: Int) {
        repository.addDeposit(amount)
    }

    func withdraw(_ amount: Int) {
        repository.addWithdrawal(amount)
    }

    func printStatement() {
        self.printer.print(self.repository.allTransactions())
    }
}


