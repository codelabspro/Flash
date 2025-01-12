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
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("")
                Text("Welcome to Flash Cards App")
                Form {
                    TextField("Email", text: $email)
                    TextField("Password", text: $password)
                }
                Button {
                    navigateToFlashTabs = true
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .padding()
            .navigationTitle("My Flash Cards")
            /* TODO-FIXME-CLEANUP
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            */
            .navigationDestination(isPresented: $navigateToFlashTabs) {
                FlashTabsView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    LandingContentView()
}
