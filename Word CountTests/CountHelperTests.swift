//
//  CountHelperTests.swift
//  Word Count
//
//  Created by James Shaw on 19/11/2017.
//  Copyright © 2017 James Shaw. All rights reserved.
//

import XCTest
@testable import Word_Count

class CountHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfChars() {
        let input = "Hello World"
        let result = CountHelper.shared.getNumberOfChars(input)
        XCTAssertEqual(11, result)
    }
    
    func testNumberOfWords() {
        let input = "Hello World"
        let result = CountHelper.shared.getNumberOfWords(input)
        XCTAssertEqual(2, result)
    }
    
    func testNumberOfLines() {
        let textView = UITextView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 60.0))
        textView.font = UIFont.systemFont(ofSize: 12.0)
        let input = "Hello World! This is a string that wraps onto 3 lines."
        let result = CountHelper.shared.getNumberOfLines(input, textView: textView)
        XCTAssertEqual(3, result)
    }
    
    func testNumberOfParagraphs() {
        let input = "Hello\nWorld"
        let result = CountHelper.shared.getNumberOfParagraphs(input)
        XCTAssertEqual(2, result)
    }
}
