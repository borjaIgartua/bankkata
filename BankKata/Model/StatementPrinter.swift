//
//  StatementPrinter.swift
//  BankKata
//
//  Created by Borja Igartua on 14.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

class StatementPrinter {
    private var printer: ConsoleInterfaz
    init(printer: ConsoleInterfaz) {
        self.printer = printer
    }
    
    func print(_ transactions: [Transaction]) {
        self.printer.printLine("DATE | AMOUNT | BALANCE")
        var sortTransactions = transactions
        sortTransactions.sort { (tr1, tr2) -> Bool in            
            let date1 = tr1.date.toDate(withFormat: Clock.FORMAT_dd_MM_YYY)
            let date2 = tr2.date.toDate(withFormat: Clock.FORMAT_dd_MM_YYY)
            let result = date1.compare(date2) == ComparisonResult.orderedAscending
            return result
        }
        
        var runningBalance = 0
        sortTransactions.map({ runningBalance += $0.amount; return statementLine($0, balance: runningBalance) }).forEach {
            self.printer.printLine($0)
        }
    }
    
    private func statementLine(_ transaction: Transaction, balance: Int) -> String {
        let amount = String(format: "%.02f", Float(exactly: transaction.amount)!)
        let bl = String(format: "%.02f", Float(exactly: balance)!)
        return transaction.date + " | " + amount + " | " + bl
    }
}

