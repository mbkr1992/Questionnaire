//
//  Questionnaire.swift
//  Questionnaire
//
//  Created by Abubakr Dar on 5/6/18.
//  Copyright © 2018 Abubakr Dar. All rights reserved.
//

import Foundation

struct Questionnaire: QuestionnaireProtocol {
    typealias QP = Question
    var questions: [QP]
}

// MARK: - Evaluation
extension Questionnaire {
    func evaluate() -> String {
        let result = getCurrentPoints()
        
        switch result {
        case 0...6:
            return "Unfortunately, we don’t match!"
        case 7...10:
            return "That looks good!"
        default:
            return "Excellent!"
        }
    }
    
    private func getCurrentPoints() -> Int {
        return self.questions.reduce(0) { (result, question) -> Int in
            return result + (question.selectedOption?.points ?? 0)
        }
    }
}
