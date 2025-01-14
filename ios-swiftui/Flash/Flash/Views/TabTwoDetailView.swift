//
//  TabTwoDetailView.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import SwiftUI
import SwiftData

struct TabTwoDetailView: View {
    @Environment(\.modelContext) private var modelContext
    let quiz: PopQuiz
    
    var body: some View {
        List {
            Section {
                if !quiz.desc.isEmpty {
                    Text(quiz.desc)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Label("\(quiz.questionCount) Questions", systemImage: "list.bullet")
                    Spacer()
                    Text(quiz.formattedCompletionPercentage)
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Questions") {
                if quiz.questions.isEmpty {
                    ContentUnavailableView("No Questions",
                        systemImage: "questionmark.circle",
                        description: Text("Add questions to this quiz to get started")
                    )
                } else {
                    ForEach(quiz.questions) { question in
                        NavigationLink {
                            TabOneDetailView(question: question)
                        } label: {
                            HStack {
                                question.icon
                                    .foregroundStyle(question.status == .answered ? .green : .blue)
                                Text(question.question)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(quiz.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Add question to quiz
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
