//
//  TabOneDetailView.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import SwiftUI
import SwiftData

struct TabOneDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var quizzes: [PopQuiz]
    let question: QuestionAnswerCombo
    @State private var showingQuizSelector = false
    @State private var showingSuccessAlert = false
    @State private var selectedQuizTitle = ""
    var body: some View {
        ZStack {
            // Matching gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.2, green: 0.2, blue: 0.3),
                    Color(red: 0.1, green: 0.1, blue: 0.2)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Main question card
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Question")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text(question.question)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Divider()
                        
                        // Options section
                        VStack(alignment: .leading, spacing: 12) {
                            OptionRow(label: "A", text: question.optionA, isCorrect: question.correctOption == 0)
                            OptionRow(label: "B", text: question.optionB, isCorrect: question.correctOption == 1)
                            OptionRow(label: "C", text: question.optionC, isCorrect: question.correctOption == 2)
                            OptionRow(label: "D", text: question.optionD, isCorrect: question.correctOption == 3)
                        }
                        
                        Divider()
                        
                        // Additional details
                        VStack(alignment: .leading, spacing: 12) {
                            if !question.answerString.isEmpty {
                                DetailRow(title: "Correct Answer", content: question.answerString)
                            }
                            
                            if let rating = question.difficultyRating {
                                DetailRow(title: "Difficulty", content: String(repeating: "⭐️", count: rating))
                            }
                            
                            DetailRow(title: "Status", content: question.status.descr)
                            DetailRow(title: "Added", content: question.dateAdded.formatted(date: .abbreviated, time: .shortened))
                            
                            if question.dateAnswered != Date.distantPast {
                                DetailRow(title: "Last Answered", content: question.dateAnswered.formatted(date: .abbreviated, time: .shortened))
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .shadow(radius: 10)
                    )
                    .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingQuizSelector = true
                } label: {
                    Label("Add to Quiz", systemImage: "plus.circle")
                }
            }
        }
        .sheet(isPresented: $showingQuizSelector) {
            QuizSelectorView(
                question: question,
                showingSuccessAlert: $showingSuccessAlert,
                selectedQuizTitle: $selectedQuizTitle
            )
        }
        .alert("Added to Quiz", isPresented: $showingSuccessAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Question added to \(selectedQuizTitle)")
        }
    }
}

struct QuizSelectorView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var quizzes: [PopQuiz]
    
    let question: QuestionAnswerCombo
    @Binding var showingSuccessAlert: Bool
    @Binding var selectedQuizTitle: String
    
    var body: some View {
        NavigationStack {
            List {
                if quizzes.isEmpty {
                    ContentUnavailableView(
                        "No Quizzes Available",
                        systemImage: "list.clipboard",
                        description: Text("Create a quiz first to add questions to it")
                    )
                } else {
                    ForEach(quizzes) { quiz in
                        QuizRowView(quiz: quiz) {
                            addToQuiz(quiz)
                        }
                    }
                }
            }
            .navigationTitle("Select Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addToQuiz(_ quiz: PopQuiz) {
        if !quiz.questions.contains(where: { $0.id == question.id }) {
            quiz.questions.append(question)
            selectedQuizTitle = quiz.title
            dismiss()
            showingSuccessAlert = true
        }
    }
}

private struct QuizRowView: View {
    let quiz: PopQuiz
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading) {
                    Text(quiz.title)
                        .font(.headline)
                    
                    Text("\(quiz.questionCount) questions")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

// Helper Views
private struct OptionRow: View {
    let label: String
    let text: String
    let isCorrect: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(label)
                .font(.headline)
                .foregroundStyle(isCorrect ? .green : .primary)
                .frame(width: 25)
            
            Text(text)
                .font(.body)
            
            if isCorrect {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            }
        }
    }
}

private struct DetailRow: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(content)
                .font(.body)
        }
    }
}
