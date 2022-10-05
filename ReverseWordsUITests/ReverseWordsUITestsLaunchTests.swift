//
//  ReverseWordsUITestsLaunchTests.swift
//  ReverseWordsUITests
//
//  Created by Елизавета Ефросинина on 07/08/2022.
//

import XCTest

class ReverseWordsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
