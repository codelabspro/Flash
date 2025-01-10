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
    var difficultyRating: Int?
    var status: Status
    
    init(question: String, optionA: String, optionB: String, optionC: String, optionD: String, correctOption: String, dateAdded: Date, dateAnswered: Date, summary: String, difficultyRating: Int, status: Status) {
        self.question = question
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.correctOption = correctOption
        self.dateAdded = dateAdded
        self.dateAnswered = dateAnswered
        self.summary = summary
        self.difficultyRating = difficultyRating
        self.status = status
    }
}


enum Status: Int, Codable, Identifiable, CaseIterable {
    case none, unanswered, answered
    
    var id: Self {
        self
    }
    
    var descr: String {
        switch self {
        case .none:
            return "None"
        case .unanswered:
            return "Unanswered"
        case .answered:
            return "Answered"
        }
    }
}
