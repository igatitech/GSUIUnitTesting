//
//  GSUIUnitTestingUITests.swift
//  GSUIUnitTestingUITests
//
//  Created by Gati Shah on 23/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import XCTest

class GSUIUnitTestingUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLoaderHiddenOnError() {
        
        let app = XCUIApplication()
        app.activate()
        app.textFields["Username"].tap()
        app.secureTextFields["Password"].tap()
        app.buttons["Login"].tap()
        let activityIndicatorView = app.activityIndicators["In progress"]
        XCTAssertFalse(activityIndicatorView.exists)
        
    }
    
    func testInvalidLogin_missingCredentialAlertIsShown() {
        
        let app = XCUIApplication()
        app.activate()
        app.textFields["Username"].tap()
        app.buttons["Login"].tap()
        let alertDilog = app.alerts["Missing Credentials"]
        XCTAssertTrue(alertDilog.exists)
        alertDilog.buttons["OK"].tap()
    }
    
    func testValidLoginSuccess() {
        let validUserName = "gatishah"
        let validPassword = "gati@123"
        
        let app = XCUIApplication()
        app.activate()
        let userNameTextField = app.textFields["Username"]
        XCTAssertTrue(userNameTextField.exists)
        userNameTextField.tap()
        userNameTextField.typeText(validUserName)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
                
        let homeScreen = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        let homeScreenShown = homeScreen.waitForExistence(timeout: 5)
        XCTAssert(homeScreenShown)
        
    }
}
