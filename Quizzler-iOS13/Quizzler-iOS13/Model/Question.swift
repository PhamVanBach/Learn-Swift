//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Bach Pham on 11/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answer: [String]
    var correctAnswer: String
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
