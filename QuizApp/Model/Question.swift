//
//  Question.swift
//  QuizApp
//
//  Created by KODDER on 14.02.2023.
//

import UIKit

struct Question {
    
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
