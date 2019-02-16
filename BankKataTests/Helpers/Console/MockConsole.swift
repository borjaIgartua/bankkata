//
//  MockConsoleV2.swift
//  BankKataTests
//
//  Created by Borja Igartua Pastor on 15/02/2019.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation
@testable import BankKata

class MockConsole: ConsoleInterfaz {
    var printLineCalls = [String]()
    func printLine(_ line: String) {
        self.printLineCalls.append(line)
    }
    
    func printLine(_ line: String) -> Bool {
        return printLineCalls.contains(line)
    }
}
