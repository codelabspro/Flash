//
//  TabThreeView.swift
//  Flash
//
//  Created by Coder on 1/12/25.
//
import SwiftUI

struct TabThreeView: View {
    @Environment(\.dismiss) private var dismiss
    
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
                .navigationTitle("Profile")
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
    }
}

#Preview {
    TabThreeView()
}
