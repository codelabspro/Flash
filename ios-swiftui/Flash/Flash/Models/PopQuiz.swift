//
//  PopQuiz.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class PopQuiz {
    var title: String
    var desc: String
    var dateCreated: Date
    var lastAccessed: Date
    @Relationship(deleteRule: .cascade) var questions: [QuestionAnswerCombo]
    var isCompleted: Bool
    
    init(
        title: String,
        desc: String = "",
        dateCreated: Date = .now,
        lastAccessed: Date = .now,
        questions: [QuestionAnswerCombo] = [],
        isCompleted: Bool = false
    ) {
        self.title = title
        self.desc = desc
        self.dateCreated = dateCreated
        self.lastAccessed = lastAccessed
        self.questions = questions
        self.isCompleted = isCompleted
    }
    
    // Computed properties
    var questionCount: Int {
        questions.count
    }
    
    var completionPercentage: Double {
        guard !questions.isEmpty else { return 0 }
        let answeredCount = questions.filter { $0.status == .answered }.count
        return Double(answeredCount) / Double(questions.count) * 100
    }
    
    var formattedCompletionPercentage: String {
        String(format: "%.1f%%", completionPercentage)
    }
    
    var icon: Image {
        if isCompleted {
            Image(systemName: "checkmark.circle.fill")
        } else if completionPercentage > 0 {
            Image(systemName: "circle.dotted")
        } else {
            Image(systemName: "circle")
        }
    }
}
