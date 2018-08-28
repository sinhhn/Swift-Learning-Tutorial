//
//  Questions.swift
//  Quizzler
//
//  Created by ホアンゴックシン on 2018/08/26.
//  Copyright © 2018 vnguider.com. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }

}
