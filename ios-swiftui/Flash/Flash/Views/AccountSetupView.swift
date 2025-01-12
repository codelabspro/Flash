//
//  AccountSetupView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

import SwiftUI

struct AccountSetupView: View {
    @State private var showingNewQuestionView = false
    
    var body: some View {
        NavigationView {
            List {
                Text("Account Setup")
            }
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
                }
            }
        }
    }
}

#Preview {
    AccountSetupView()
}
