//
//  ContentView.swift
//  Flash
//
//  Created by Coder on 1/10/25.
//

import SwiftUI

struct LandingContentView: View {
    @State private var navigateToFlashTabs = false
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
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
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
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
