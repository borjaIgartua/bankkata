//
//  MockClock.swift
//  BankKataTests
//
//  Created by Borja Igartua on 15.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

@testable import BankKata

class MockClock: Clock {
    private let stubHelper = StubWrapper()

    // MARK: - todayAsString
    override func todayAsString() -> String {
        return stubHelper.stubedParams(for: "todayAsString -> String") as! String
    }

    func todayAsString() -> Stub {
        self.stubHelper.addRunninMethod("todayAsString -> String")
        return stubHelper
    }
}
