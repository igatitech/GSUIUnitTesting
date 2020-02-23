//
//  GSUIUnitTestingTests.swift
//  GSUIUnitTestingTests
//
//  Created by Gati Shah on 23/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import XCTest
@testable import GSUIUnitTesting

class GSUIUnitTestingTests: XCTestCase {
    func testHelloWorld() {
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        helloWorld = "Hello World"
        XCTAssertEqual(helloWorld, "Hello World")
    }
}
