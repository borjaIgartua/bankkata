//
//  Stub.swift
//  BankKataTests
//
//  Created by Borja Igartua on 15.02.19.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation

protocol Stub {
    func willReturn(_ param: Any?)
}

internal class StubWrapper: Stub {
    private var stubbedParams = [String: Any]()
    private var runningStubMethod: String!

    func addRunninMethod(_ method: String) {
        self.runningStubMethod = method
    }

    func stubedParams(for method: String) -> Any? {
        return self.stubbedParams[method]
    }

    func willReturn(_ param: Any?) {
        self.stubbedParams[self.runningStubMethod] = param
    }
}
