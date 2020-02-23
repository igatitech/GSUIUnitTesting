//
//  ViewControllerTests.swift
//  GSUIUnitTestingTests
//
//  Created by Gati Shah on 23/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import XCTest
@testable import GSUIUnitTesting

class ViewControllerTests: XCTestCase {
    let vc = ViewController()
    
    func testSquareInt() {
        let value = 3
        let squareValue = value.square()
        XCTAssertEqual(squareValue, 9)
    }
    
    func testFirstName() {
        vc.firstName = "Gati"
        XCTAssertTrue(vc.validFirstName())
    }
    
    func testEmailAddress() {
        vc.email = "xyz@abc.com"
        XCTAssertTrue(vc.isValidEmail(vc.email ?? ""))
        
        vc.email = "aaaaaaa"
        XCTAssertFalse(vc.isValidEmail(vc.email ?? ""))
    }
    
    func testFibonacciSeries() {
        let sum = vc.computeFibonacciSeries(seriesValue: 6)
        XCTAssertEqual(sum, 8)
    }
}
