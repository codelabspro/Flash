//
//  TabOneDetailView.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import SwiftUI

struct TabOneDetailView: View {
    let question: QuestionAnswerCombo
    
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
                                DetailRow(title: "Summary", content: question.answerString)
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
