//
//  MockConsole.swift
//  BankKataTests
//
//  Created by Borja Igartua on 13.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation
@testable import BankKata

class MockConsole: ConsoleInterfaz {
    public var consoleLog: String = ""

    func printLine(_ line: String) {
        self.consoleLog.append(line)
    }
}
