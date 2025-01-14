//
//  NewPopQuizView.swift
//  Flash
//
//  Created by Coder on 1/14/25.
//

import SwiftUI
import SwiftData

struct NewPopQuizView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var desc = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $desc, axis: .vertical)
                        .lineLimit(3...6)
                }
                
                Section {
                    Text("Questions can be added after creating the quiz")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
            }
            .navigationTitle("New Pop Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        savePopQuiz()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    private func savePopQuiz() {
        let newQuiz = PopQuiz(
            title: title,
            desc: desc
        )
        modelContext.insert(newQuiz)
        dismiss()
    }
}
