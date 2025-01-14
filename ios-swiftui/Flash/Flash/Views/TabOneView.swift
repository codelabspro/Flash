//
//  TabOneView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

import SwiftUI
import SwiftData

struct TabOneView: View {
    @State private var showingNewQuestionView = false
    @Query(sort: \QuestionAnswerCombo.question) private var questions: [QuestionAnswerCombo]
    
    var body: some View {
        NavigationView {
            ZStack {
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
                    LazyVStack(spacing: 16) {
                        ForEach(questions) { question in
                            NavigationLink(destination: TabOneDetailView(question: question)) {
                                
                                QuestionCard(question: question)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            /* TODO-FIXME
                            NavigationLink {
                                Text(question.summary)
                            } label: {
                                
                                QuestionCard(question: question)
                            }
                            .buttonStyle(PlainButtonStyle())
                            */
                        }
                    }
                    .padding()
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .navigationTitle("Flash")
                .navigationBarItems(trailing:
                    Button(action: {
                        showingNewQuestionView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                    }
                )
                .sheet(isPresented: $showingNewQuestionView) {
                    NavigationStack {
                        NewQuestionAnswerComboView(
                            question: "",
                            optionA: "",
                            optionB: "",
                            optionC: "",
                            optionD: "",
                            correctOption: 0,
                            dateAdded: Date(),
                            dateAnswered: Date(),
                            answerString: "",
                            status: .new
                        )
                        .presentationDetents([.large])
                    }
                }
            }
        }
    }
}

struct QuestionCard: View {
    let question: QuestionAnswerCombo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                question.icon
                VStack(alignment: .leading) {
                    Text(question.question)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    if let difficultyRating = question.difficultyRating {
                        HStack {
                            ForEach(0..<difficultyRating) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            }

            
            VStack(alignment: .leading, spacing: 8) {
                Text("Options:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        OptionView(label: "A", text: question.optionA)
                        OptionView(label: "B", text: question.optionB)
                    }
                    VStack(alignment: .leading) {
                        OptionView(label: "C", text: question.optionC)
                        OptionView(label: "D", text: question.optionD)
                    }
                }
            }
            
            HStack {
                Label("Correct: \(question.correctOption)", systemImage: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Spacer()
                Text(question.answerString)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.15, green: 0.15, blue: 0.25))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        )
    }
}

struct OptionView: View {
    let label: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(label + ":")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}



#Preview {
    TabOneView()
        .modelContainer(for: QuestionAnswerCombo.self, inMemory: true)
}
