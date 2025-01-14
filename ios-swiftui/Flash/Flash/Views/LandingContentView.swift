//
//  ContentView.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//
import SwiftUI

struct LandingContentView: View {
    @State private var navigateToFlashTabs = false
    @State var email: String = ""
    @State var password: String = ""
    
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
                
                VStack(spacing: 24) {
                    Image(systemName: "cpu.fill")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                        .font(.system(size: 40))
                    
                    Text("Welcome to Test Prep Center")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 16) {
                        // Email Field
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Email")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.9))
                            
                            NicheTextField(
                                placeholder: "Enter your email",
                                text: $email,
                                systemImage: "envelope"
                            )
                        }
                        
                        // Password Field
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Password")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.9))
                            
                            NicheTextField(
                                placeholder: "Enter your password",
                                text: $password,
                                systemImage: "lock",
                                isSecure: true
                            )
                        }
                    }
                    .padding(.vertical, 12)
                    
                    Button {
                        navigateToFlashTabs = true
                    } label: {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue)
                                    .shadow(color: .black.opacity(0.2), radius: 2, y: 1)
                            )
                    }
                }
                .padding(.horizontal, 24)
            }
            .navigationTitle("Flash")
            .navigationDestination(isPresented: $navigateToFlashTabs) {
                FlashTabsView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// Renamed to NicheTextField
struct NicheTextField: View {
    let placeholder: String
    @Binding var text: String
    let systemImage: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImage)
                .foregroundStyle(.white.opacity(0.6))
                .frame(width: 20)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textInputAutocapitalization(.never) // Disable autocapitalization
                    .onChange(of: text) { newValue in
                        text = newValue.lowercased() // Convert to lowercase
                    }
            } else {
                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.never) // Disable autocapitalization
                    .onChange(of: text) { newValue in
                        text = newValue.lowercased() // Convert to lowercase
                    }
            }
        }
        .foregroundStyle(.white)
        .tint(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.black.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                )
        )
        .shadow(color: .black.opacity(0.1), radius: 2, y: 1)
    }
}
// Optional: Add hover effect (macOS only)
#if os(macOS)
extension NicheTextField {
    func onHover(_ hover: Bool) {
        if hover {
            NSCursor.pointingHand.push()
        } else {
            NSCursor.pop()
        }
    }
}
#endif

#Preview {
    LandingContentView()
}
