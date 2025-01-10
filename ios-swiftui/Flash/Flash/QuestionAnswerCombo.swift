//
//  QuestionAnswerCombo.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//

import Foundation

class QuestionAnswerCombo: Codable {
    var question: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    var correctOption: String
    var dateAdded: Date
    var dateAnswered: Date
    var summary: String
    var difficultyRating: Int
}
