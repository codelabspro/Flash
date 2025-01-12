//
//  AccountSetupView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//


import SwiftUI

struct AccountSetupView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Account Setup")
            }
            .padding()
            .navigationTitle("My Flash Cards")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    AccountSetupView()
}
