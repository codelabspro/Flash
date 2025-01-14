//
//  TabTwoView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//
import SwiftUI
import SwiftData

struct TabTwoView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \PopQuiz.dateCreated, order: .reverse) private var quizzes: [PopQuiz]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.2, green: 0.2, blue: 0.3),
                        Color(red: 0.1, green: 0.1, blue: 0.2)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                if quizzes.isEmpty {
                    ContentUnavailableView(
                        "No Quizzes",
                        systemImage: "list.clipboard",
                        description: Text("Create your first quiz by tapping the + button")
                    )
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(quizzes) { quiz in
                                QuizCard(quiz: quiz)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Pop Quizzes")
        }
    }
}

private struct QuizCard: View {
    let quiz: PopQuiz
    
    var body: some View {
        NavigationLink(destination: TabTwoDetailView(quiz: quiz)) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    quiz.icon
                        .font(.title2)
                        .foregroundStyle(quiz.isCompleted ? .green : .blue)
                    
                    Text(quiz.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("\(quiz.questionCount) Questions")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                if !quiz.desc.isEmpty {
                    Text(quiz.desc)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                
                HStack {
                    ProgressView(value: quiz.completionPercentage, total: 100)
                        .tint(progressColor(for: quiz.completionPercentage))
                    
                    Text(quiz.formattedCompletionPercentage)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Label(quiz.dateCreated.formatted(date: .abbreviated, time: .omitted),
                          systemImage: "calendar")
                    
                    Spacer()
                    
                    Label("Last used \(quiz.lastAccessed)",
                          systemImage: "clock")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
            )
            .shadow(radius: 5)
        }
    }
    
    private func progressColor(for percentage: Double) -> Color {
        switch percentage {
        case 100: return .green
        case 70...: return .blue
        case 30...: return .orange
        default: return .red
        }
    }
}

// Preview provider
#Preview {
    TabTwoView()
        .modelContainer(for: PopQuiz.self, inMemory: true)
}
