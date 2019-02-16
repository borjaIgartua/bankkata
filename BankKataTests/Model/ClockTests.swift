//
//  ClockTests.swift
//  BankKataTests
//
//  Created by Borja Igartua Pastor on 15/02/2019.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import XCTest
@testable import BankKata

class ClockTests: XCTestCase {
    
    func testTodayDateAsddMMYYYFormat() {
        let clock = TestableClock()
        
        XCTAssertEqual(clock.todayAsString(), "17/02/2019")
    }
    
    class TestableClock: Clock {
        override func today() -> Date {
            var dateComponents = DateComponents()
            dateComponents.year = 2019
            dateComponents.month = 2
            dateComponents.day = 17
            
            let calendar = Calendar.current
            return calendar.date(from: dateComponents)!
        }
    }
}




