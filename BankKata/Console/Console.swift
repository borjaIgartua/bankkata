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

struct Console: ConsoleInterfaz {
    
    func printLine(_ line: String) {
        print(line)
    }
}




