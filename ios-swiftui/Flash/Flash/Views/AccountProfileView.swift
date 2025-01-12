//
//  AccountProfileView.swift
//  Flash
//
//  Created by Coder on 1/12/25.
//
import SwiftUI

struct AccountProfileView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding()
                }
            }

        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Action for the button
                } label: {
                    Image(systemName: "gear")
                        .imageScale(.large)
                }
            }
        }
    }
}
