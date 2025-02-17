//
//  QuestionAnswerCombo.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class QuestionAnswerCombo {

    var question: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    var correctOption: Int
    var dateAdded: Date
    var dateAnswered: Date
    var answerString: String
    var difficultyRating: Int?
    var status: Status
    
    init(
        question: String,
        optionA: String,
        optionB: String,
        optionC: String,
        optionD: String,
        correctOption: Int,
        dateAdded: Date = Date.now,
        dateAnswered: Date = Date.distantPast,
        answerString: String = "",
        difficultyRating: Int? = nil,
        status: Status = .new
    ) {
        self.question = question
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.correctOption = correctOption
        self.dateAdded = dateAdded
        self.dateAnswered = dateAnswered
        self.answerString = answerString
        self.difficultyRating = difficultyRating
        self.status = status
    }
    
    var icon: Image {
        switch status {
        case .new:
            Image(systemName: "checkmark.diamond.fill")
        case .unanswered:
            Image(systemName: "book.fill")
        case .answered:
            Image(systemName: "books.vertical.fill")
         }
    }
}


enum Status: Int, Codable, Identifiable, CaseIterable {
    case new, unanswered, answered
    
    var id: Self {
        self
    }
    
    var descr: String {
        switch self {
        case .new:
            return "New"
        case .unanswered:
            return "Unanswered"
        case .answered:
            return "Answered"
        }
    }
}
