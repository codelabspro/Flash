//
//  AccountVerificationView.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

//
//  ContentView.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//

import SwiftUI

struct AccountVerificationView: View {
    var body: some View {
        NavigationStack {
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

#Preview {
    AccountVerificationView()
}
