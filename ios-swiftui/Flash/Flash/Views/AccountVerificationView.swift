//
//  AccountVerificationView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

import SwiftUI

struct AccountVerificationView: View {
    var body: some View {
        NavigationStack {
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
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Account Verification")
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
}

#Preview {
    AccountVerificationView()
}
