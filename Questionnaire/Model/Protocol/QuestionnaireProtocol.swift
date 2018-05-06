//
//  Questionnaire.swift
//  Questionnaire
//
//  Created by Abubakr Dar on 5/6/18.
//  Copyright © 2018 Abubakr Dar. All rights reserved.
//

import Foundation

protocol OptionProtocol: Equatable {
    var id: Int { get }
    var points: Int { get }
    var statement: String { get }
}

protocol QuestionProtocol {
    associatedtype OP
    
    var question: String { get }
    var options: [OP] { get }
    var selectedOption: OP? { get }
    
    mutating func setSelectedOption(option: OP?) throws
}

protocol QuestionnaireProtocol {
    associatedtype QP
    
    var questions: [QP] { get }
    func evaluate() -> String
}
