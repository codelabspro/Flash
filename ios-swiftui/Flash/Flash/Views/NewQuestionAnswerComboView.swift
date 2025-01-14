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
    @State var correctOption: Int? = 0
    @State var dateAdded: Date
    @State var dateAnswered: Date
    @State var answerString: String
    @State var difficultyRating: Int = 3
    @State var status: Status
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Question", text: $question)
                TextField("Summary", text: $answerString)
                // In your Form:
                Section("Question Options") {
                    TextField("Option A", text: $optionA)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Option B", text: $optionB)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Option C", text: $optionC)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Option D", text: $optionD)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Correct Answer", selection: $correctOption) {
                        Text("A").tag(0)
                        Text("B").tag(1)
                        Text("C").tag(2)
                        Text("D").tag(3)
                    }
                    .pickerStyle(.segmented)
                }
                Picker("Difficulty", selection: $difficultyRating) {
                    ForEach(1...5, id: \.self) { rating in
                        Text("\(rating)").tag(rating)
                    }
                }
                .pickerStyle(.wheel)
                Button("Create") {
                    let newQuestionAnswerCombo = QuestionAnswerCombo(
                        question: question,
                        optionA: optionA,
                        optionB: optionB,
                        optionC: optionC,
                        optionD: optionD,
                        correctOption: correctOption ?? 0,
                        dateAdded: dateAdded,
                        dateAnswered: dateAnswered,
                        answerString: answerString,
                        difficultyRating: difficultyRating
                    )
                    modelContext.insert(newQuestionAnswerCombo)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(question.isEmpty || answerString.isEmpty)
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
        correctOption: 0,
        dateAdded: Date(),
        dateAnswered: Date(),
        answerString: "Geography Question",
        status: .new
    )
}
