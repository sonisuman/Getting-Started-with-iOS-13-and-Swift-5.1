//
//  Question.swift
//  Quizzler
//
//  Created by Soni Suman on 12/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var  answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String],correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
