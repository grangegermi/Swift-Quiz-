//
//  QuizModel.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 12.04.26.
//

import Foundation

struct QuizModel: Decodable {
    let question: String
    let options: [String]
    let correct: Int
}
