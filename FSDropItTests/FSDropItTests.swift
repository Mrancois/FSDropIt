//
//  FSDropItTests.swift
//  FSDropIt
//
//  Created by Francois Devove on 15.02.17.
//  Copyright © 2017 Francois Devove. All rights reserved.
//

import XCTest
@testable import FSDropIt

class FSDropItTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInit() {
        let theItems: [String] = ["Toto", "Tata", "Tutu", "Tete", "Tyty"]
        let m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
        XCTAssertEqual(m.isShown, false)
        XCTAssertEqual(m.x, 25.0)
        XCTAssertEqual(m.y, 25.0)
        XCTAssertEqual(m.width, 110.0)
        XCTAssertEqual(m.heightBtn, 45.0)
        XCTAssertEqual(m.heightView, 150.0)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTextButton() {
        let theItems: [String] = ["Toto", "Tata", "Tutu", "Tete", "Tyty"]
        let m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
        m.changeTextButton(texte: "toto")
        XCTAssertEqual(m.button.titleLabel!.text, "toto")
    }
    
    func testButtonBackgroundColor() {
        let theItems: [String] = ["Toto", "Tata", "Tutu", "Tete", "Tyty"]
        let m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
        m.setButtonBackgroundColor(color: UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0))
        XCTAssertEqual(m.button.backgroundColor, UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0))
    }
    
    func testButtonBorder() {
        let theItems: [String] = ["Toto", "Tata", "Tutu", "Tete", "Tyty"]
        let m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
        m.setButtonBorder(borderWidth: 1.0, borderColor: UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0))
        XCTAssertEqual(m.button.layer.borderWidth, 1.0)
        XCTAssertEqual(m.button.layer.borderColor, UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0).cgColor)
    }
    
    func testTableViewBorder() {
        let theItems: [String] = ["Toto", "Tata", "Tutu", "Tete", "Tyty"]
        let m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
        m.setTableviewBorder(borderWidth: 1.0, borderColor: UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0))
        XCTAssertEqual(m.tableview.layer.borderWidth, 1.0)
        XCTAssertEqual(m.tableview.layer.borderColor, UIColor(red:0.09, green:0.11, blue:0.40, alpha:1.0).cgColor)
    }
    
}
