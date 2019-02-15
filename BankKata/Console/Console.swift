//
//  Console.swift
//  BankKata
//
//  Created by Borja Igartua on 13.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

protocol ConsoleInterfaz {
    func printLine(_ line: String)
}

struct Console {
    private var console: ConsoleInterfaz

    init(console: ConsoleInterfaz) {
        self.console = console
    }

    func printLine(_ line: String) {
        self.console.printLine(line)
    }
}




