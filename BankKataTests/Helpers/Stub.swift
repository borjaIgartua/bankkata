//
//  Stub.swift
//  BankKataTests
//
//  Created by Borja Igartua on 15.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

protocol Stub {
    func willReturn(_ params: Any?...)
}

internal class StubWrapper: Stub {
    private var stubbedParams = [String: Any]()
    private var runningStubMethod: String!
    private var currentIndex = 0

    func addRunninMethod(_ method: String) {
        self.runningStubMethod = method
    }

    func stubedParams(for method: String) -> Any? {
        let result = self.stubbedParams[method + String(currentIndex)]
        currentIndex += 1
        return result
    }
    
    func willReturn(_ params: Any?...) {
        for (index, param) in params.enumerated() {
            self.stubbedParams[self.runningStubMethod + String(index)] = param
        }
    }
}
