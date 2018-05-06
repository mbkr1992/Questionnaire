//
//  Question.swift
//  Questionnaire
//
//  Created by Abubakr Dar on 5/6/18.
//  Copyright © 2018 Abubakr Dar. All rights reserved.
//

import Foundation

enum QuestionError: Error {
    case invalidOption(error: String)
}

struct Question: QuestionProtocol {
    
    typealias OP = Option
    
    var question: String
    var options: [OP]
    var selectedOption: OP?
    
    mutating func setSelectedOption(option: OP?) throws {
        if let option = option {
            guard let index = self.options.index(where: { $0 == option }) else {
                throw QuestionError.invalidOption(error: "")
            }
            
            self.selectedOption = self.options[index]
        } else {
         self.selectedOption = option
        }
    }
}
