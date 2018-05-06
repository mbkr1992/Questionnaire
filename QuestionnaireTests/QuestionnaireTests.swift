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
        var questionnaire = Questionnaire(questions: [
            Question(question: "",  options: [
                Option(id: 1, statement: "Teamwork is in my blood", points: 5),
                Option(id: 2, statement: "Yes, I do", points: 3),
                Option(id: 3, statement: "I prefer to work alone", points: 0)
                ], selectedOption: nil),
            Question(question: "", options: [
                Option(id: 1, statement: "Never", points: 0),
                Option(id: 2, statement: "Less than 1 year", points: 1),
                Option(id: 3, statement: "Less than 2 years", points: 3),
                Option(id: 4, statement: "More than 3 years", points: 5),
                ], selectedOption: nil),
            Question(question: "How do you feel about automated tests?", options: [
                Option(id: 1, statement: "Mandatory", points: 3),
                Option(id: 2, statement: "Waste of time", points: 0),
                ], selectedOption: nil)
        ])
        describe("Questionnaire") {
            context("User skips all the questions", closure: {
                it("should tell user is incompatible", closure: {
                    expect(questionnaire.evaluate()).to(equal("Unfortunately, we don’t match!"))
                })
            })
            
            context("User chooses best answers to all the questions ", closure: {
                beforeEach {
                    do {
                        try questionnaire.questions[0].setSelectedOption(option: Option(id: 1, statement: "Teamwork is in my blood", points: 5))
                            
                        try questionnaire.questions[1].setSelectedOption(option: Option(id: 3, statement: "Less than 2 years", points: 3))
                            
                        try questionnaire.questions[2].setSelectedOption(option: Option(id: 1, statement: "Mandatory", points: 3))
                    } catch {
                        XCTAssertTrue(false, "Mock data is invalid.")
                    }
                }
                
                it("should tell user is excellent contender", closure: {
                    expect(questionnaire.evaluate()).to(equal("Excellent!"))
                })
                
                afterEach {
                    do {
                        try questionnaire.questions[0].setSelectedOption(option: nil)
                        try questionnaire.questions[1].setSelectedOption(option: nil)
                        try questionnaire.questions[2].setSelectedOption(option: nil)
                    } catch {
                        XCTAssertTrue(false, "Mock data is invalid.")
                    }
                }
            })
            
            context("User chooses mixed answers to the given questions", closure: {
                beforeEach {
                    do {
                        try questionnaire.questions[0].setSelectedOption(option: Option(id: 2, statement: "Yes, I do", points: 3))
                        
                        try questionnaire.questions[1].setSelectedOption(option: Option(id: 4, statement: "More than 3 years", points: 5))
                        
                        try questionnaire.questions[2].setSelectedOption(option: Option(id: 2, statement: "Waste of time", points: 0))
                    } catch {
                        XCTAssertTrue(false, "Mock data is invalid.")
                    }
                }
                
                it("should tell user is excellent contender", closure: {
                    expect(questionnaire.evaluate()).to(equal("That looks good!"))
                })
                
                afterEach {
                    do {
                        try questionnaire.questions[0].setSelectedOption(option: nil)
                        try questionnaire.questions[1].setSelectedOption(option: nil)
                        try questionnaire.questions[2].setSelectedOption(option: nil)
                    } catch {
                        XCTAssertTrue(false, "Mock data is invalid.")
                    }
                }
            })
        }
    }
}
