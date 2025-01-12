//
//  NewQuestionAnswerComboView.swift
//  Flash
//
//  Created by Coder on 1/12/25.
//

import SwiftUI

struct NewQuestionAnswerComboView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var question: String
    @State var optionA: String
    @State var optionB: String
    @State var optionC: String
    @State var optionD: String
    @State var correctOption: String
    @State var dateAdded: Date
    @State var dateAnswered: Date
    @State var summary: String
    @State var difficultyRating: Int?
    @State var status: Status
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Question", text: $question)
                TextField("Summary", text: $summary)
                Button("Create") {
                    let newQuestionAnswerCombo = QuestionAnswerCombo(
                        question: question,
                        optionA: optionA,
                        optionB: optionB,
                        optionC: optionC,
                        optionD: optionD,
                        correctOption: correctOption,
                        dateAdded: dateAdded,
                        dateAnswered: dateAnswered,
                        summary: summary
                    )
                    modelContext.insert(newQuestionAnswerCombo)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(question.isEmpty || summary.isEmpty)
                .navigationTitle("New Flash Card")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button("Cancel") { dismiss() }
                    }
                }
            }
        }
    }
    
}

#Preview {
    NewQuestionAnswerComboView(
        question: "What is the capital of France?",
        optionA: "Berlin",
        optionB: "Madrid",
        optionC: "Paris",
        optionD: "Rome",
        correctOption: "Paris",
        dateAdded: Date(),
        dateAnswered: Date(),
        summary: "Geography Question",
        status: .new
    )
}
