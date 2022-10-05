//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Елизавета Ефросинина on 07/08/2022.
//

import XCTest
@testable import reverseWords

class ReverseWordsTests: XCTestCase {

    var sut: ReverseWordsViewModel!

    override func setUpWithError() throws {

        sut = ReverseWordsViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_emptyString1() {
        XCTAssertTrue(sut.reverse(input: "").isEmpty)
    }

    func test_singleWords() {
        let string = "Test"
        let expectedString = "tseT"
        XCTAssertEqual(expectedString, sut.reverse(input: string))
    }

    func test_multipleWords() {

        let firstString = "Test is important"
        let expectedFirstSting = "tseT si tnatropmi"

        let secondString = "My favorite coffee"
        let expectedSecondString = "yM etirovaf eeffoc"

        XCTAssertEqual(expectedFirstSting, sut.reverse(input: firstString))
        XCTAssertEqual(expectedSecondString, sut.reverse(input: secondString))
    }

    func testReverseLetters_singleWord() {
        sut.reverseMode = .letters

        let firstExample = "Word178"
        let expectedFirstExample = "droW178"

        XCTAssertEqual(expectedFirstExample, sut.reverse(input: firstExample))
    }

    func testReverseLetters_empty() {
        sut.reverseMode = .letters
        
        let string = ""
        let expectedString = ""

        XCTAssertEqual(expectedString, sut.reverse(input: string))
    }

    func testReverseLetters_multipleWords() {
        sut.reverseMode = .letters
        
        let string = "asdf123 lkjh"
        let expectedString = "fdsa123 hjkl"

        XCTAssertEqual(expectedString, sut.reverse(input: string))
    }
    
    func testReverseWithException_emptyString() {
        sut.reverseMode = .custom
    
        let string = ""
        let expectedString = ""
        
        XCTAssertEqual(expectedString, sut.reverse(input: string))
    }
    
    func testReverseWithException_singleWord() {
        sut.reverseMode = .custom
        sut.updateCharacterSet(from: "Tea")
        
        let string = "MozumsTea"
        let expectedString = "smuzoMTea"
        
        XCTAssertEqual(expectedString, sut.reverse(input: string))
    }
    
    func testReverseWithException_multipleWord() {
        sut.reverseMode = .custom
        sut.updateCharacterSet(from: "H f")
        
        let string = "Hello, friend"
        let expectedString = "H,olle fdneir"
        
        XCTAssertEqual(expectedString, sut.reverse(input: string))
        
    }
}
