//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ezequiel Parada Beltran on 03/09/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choises: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = correctAnswer
        choises = a
        
    }
}
