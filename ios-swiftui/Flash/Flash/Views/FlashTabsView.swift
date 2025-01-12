//
//  FlashCardsView.swift
//  Flash
//
//  Created by Coder on 1/12/25.
//


import SwiftUI

struct FlashTabsView: View {
    var body: some View {
        TabView {
            AccountSetupView()
                .tabItem {
                    Label("Setup", systemImage: "person.crop.circle")
                }
            
            AccountVerificationView()
                .tabItem {
                    Label("Verify", systemImage: "checkmark.circle")
                }
        }
        .navigationBarTitle("Flash Cards", displayMode: .large)
    }
}

#Preview {
    FlashTabsView()
}
