//
//  AccountSetupView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

import SwiftUI
import SwiftData

struct AccountSetupView: View {
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
                
                List {
                    Text("Flash Cards")
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .padding()
                .navigationTitle("Setup")
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
                            correctOption: "",
                            dateAdded: Date(),
                            dateAnswered: Date(),
                            summary: "",
                            status: .new
                        )
                        .presentationDetents([.large, .medium])
                    }
                }
            }
        }
    }
}

#Preview {
    AccountSetupView()
}
