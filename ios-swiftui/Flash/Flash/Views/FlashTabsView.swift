//
//  FlashTabsView.swift
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
                    Label("Questions", systemImage: "person.crop.circle")
                }
            
            AccountVerificationView()
                .tabItem {
                    Label("Test", systemImage: "checkmark.circle")
                }
            
            AccountProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    FlashTabsView()
}
