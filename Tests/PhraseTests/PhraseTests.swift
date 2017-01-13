//
//  PhraseTests.swift
//  PhraseTests
//
//  Created by Cody Robertson on 1/13/17.
//  Copyright © 2017 Cody Robertson. All rights reserved.
//

import XCTest
@testable import Phrase

class PhraseTests: XCTestCase {
    
    // MARK: -
    // MArRK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: -
    // MARK: Tests
    
    func test_format_withoutReplacements() {
        let template = "{greeting}, {name}{punctuation}"
        let formatted = Phrase(template: template).format()
        
        XCTAssert(template == formatted)
    }
    
    func test_format_withReplacements() {
        let expected = "Hello, Cody!"
        let formatted = Phrase(template: "{greeting}, {name}{punctuation}")
            .put(key: "greeting", value: "Hello")
            .put(key: "name", value: "Cody")
            .put(key: "punctuation", value: "!")
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_format_withReplacements_multiplePlacesInTemplate() {
        let expected = "This football looks just like an football."
        let formatted = Phrase(template: "This {object} looks just like an {object}.")
            .put(key: "object", value: "football")
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_format_withReplacements_otherThanString() {
        let expected = "The number 100 is positive: true"
        let formatted = Phrase(template: "The number {number} is positive: {result}")
            .put(key: "number", value: 100)
            .put(key: "result", value: true)
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_format_withReplacements_withKeysNotFound() {
        let expected = "The {key} is {value}"
        let formatted = Phrase(template: "The {key} is {value}")
            .put(key: "name", value: "Cody")
            .put(key: "age", value: 21)
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_format_handlesOddTemplate_twoLeftBraces() {
        let expected = "This {apple is messed up"
        let formatted = Phrase(template: "This {{item} is messed up")
            .put(key: "item", value: "apple")
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_format_handlesOddTemplate_twoRightBraces() {
        let expected = "This apple} is messed up"
        let formatted = Phrase(template: "This {item}} is messed up")
            .put(key: "item", value: "apple")
            .format()
        
        XCTAssert(expected == formatted)
    }
    
    func test_formatted_handlesOddTemplate_twoOuterBraces() {
        let expected = "This {apple} is messed up"
        let formatted = Phrase(template: "This {{item}} is messed up")
            .put(key: "item", value: "apple")
            .format()
        
        XCTAssert(expected == formatted)
    }
    
}
