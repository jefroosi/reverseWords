//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Елизавета Ефросинина on 07/08/2022.
//

import XCTest

class ReverseWordsUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {

        app = XCUIApplication()
        app.launch()

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func reverseExample(input: String) {
        let string = app.textFields["Text to reverse"]
        string.tap()
        string.typeText(input)
        app.buttons["Reverse"].tap()
    }

    func test_Example(example: String) {

        let inputString = "Coffee"
        let expectedString = "eeffoC"
        reverseExample(input: inputString)
        XCTAssertEqual(expectedString, app.staticTexts["Reversed text"].label)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
