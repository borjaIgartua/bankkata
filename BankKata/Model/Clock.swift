//
//  Clock.swift
//  BankKata
//
//  Created by Borja Igartua on 15.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

class Clock {
    
    public static let FORMAT_dd_MM_YYY = "dd/MM/yyyy"
    
    func todayAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Clock.FORMAT_dd_MM_YYY
        
        return formatter.string(from: self.today())
    }
    
    internal func today() -> Date {
        return Date()
    }
}



