//
//  QuestionnaireTests.swift
//  QuestionnaireTests
//
//  Created by Abubakr Dar on 5/6/18.
//  Copyright © 2018 Abubakr Dar. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import Questionnaire


class QuestionnaireTests: QuickSpec {
    override func spec() {
        describe("test describle") {
            beforeEach {
            }
            
            it("should work", closure: {
                expect(123).to(equal(123))
            })
        }
    }
}
